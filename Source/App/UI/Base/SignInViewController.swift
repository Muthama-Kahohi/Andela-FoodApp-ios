import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    var signinButton = UIButton()
    internal var viewModel: SignInViewModel = SignInViewModel()
    override func viewDidLoad() {

        super.viewDidLoad()

        //Intialize the sign in
        
        guard let instance = GIDSignIn.sharedInstance() else { return }
        
        instance.clientID = FirebaseApp.app()?.options.clientID
        instance.delegate = self
        instance.hostedDomain = viewModel.domain
        instance.uiDelegate = self

        setupSigninButtton()
    }

    @objc func signinButtonPressed() {
        
        GIDSignIn.sharedInstance().signIn()
    }
    
    func segueToNextScreen() {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        
        if let navigationController = storyboard.instantiateViewController(withIdentifier: "navigationController") as? UINavigationController {
            navigationController.modalPresentationStyle = .overFullScreen
            self.topViewController.present(navigationController,
                                           animated: true)
        }
    }
 
    func setupSigninButtton() {

        let buttonColor =  UIColor(red: 242/255, green: 57/255, blue: 62/255, alpha: 1)

        signinButton.translatesAutoresizingMaskIntoConstraints = false

        signinButton.layer.cornerRadius = 10
        signinButton.layer.borderWidth = 1

        signinButton.setTitle("Sign In with Google", for: .normal)
        signinButton.setTitleColor(.white, for: .normal)

        signinButton.backgroundColor = buttonColor
        view.addSubview(signinButton)

        let centerYConstraint = NSLayoutConstraint(item: signinButton,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 280)

        let centerXConstraint = NSLayoutConstraint(item: signinButton,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0)

        let buttonHeightConstraint = NSLayoutConstraint(item: signinButton,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1,
                                                        constant: 60)

        let buttonWidthConstraint =   NSLayoutConstraint(item: signinButton,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil, attribute: .notAnAttribute,
                                                         multiplier: 1,
                                                         constant: 235)


        view.addConstraint(centerYConstraint)
        view.addConstraint(centerXConstraint)
        view.addConstraint(buttonHeightConstraint)
        view.addConstraint(buttonWidthConstraint)

        signinButton.addTarget(self,
                               action: #selector(signinButtonPressed),
                               for: .touchUpInside)

    }
}

extension SignInViewController {

    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    private var topViewController: UIViewController {
        guard
            let tvc = appDelegate?.window?.rootViewController else { return UIViewController() }
        return tvc
    }
}

extension SignInViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        if let authentication = user.authentication {
            
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if error == nil {
                    self.appDelegate?.currentUser = user!
                    self.appDelegate?.currentUserId = (user?.uid)!
                }
            }
            
            self.segueToNextScreen()
        }
    }
}
