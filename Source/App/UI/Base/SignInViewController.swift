import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {


    var signinButton = UIButton()
    override func viewDidLoad() {

        super.viewDidLoad()
        
        signIn.style = .wide
        
        //Intialize the sign in
        
        guard let instance = GIDSignIn.sharedInstance() else { return }
        
        instance.hostedDomain = viewModel.domain
        instance.uiDelegate = self
        instance.signInSilently()
        
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

        signinButton.addTarget(self, action: #selector(signinButtonPressed), for: .touchUpInside)

    }
}
