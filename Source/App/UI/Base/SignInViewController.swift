import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    // MARK: UIOutlets

    @IBOutlet public weak var signIn: GIDSignInButton!
    
    // MARK: Internal Properties
    
    internal var viewModel: SignInViewModel = SignInViewModel()
    
    // MARK: Public Instance Methods
    
    override public func viewDidLoad() {

        super.viewDidLoad()

        signIn.style = .wide

        //Intialize the sign in
        
        guard let FirApp = FirebaseApp.app() else { return }
        guard let instance = GIDSignIn.sharedInstance() else { return }

        instance.clientID = FirApp.options.clientID
        instance.hostedDomain = viewModel.domain
        instance.uiDelegate = self
        instance.delegate = self
        instance.signInSilently()
    }
    
    // MARK: Internal Instance Methods

    internal func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {

        if let error = error {

            print ("\(error.localizedDescription)")
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let navigationController = storyboard.instantiateViewController(withIdentifier: "navigationController") as? UINavigationController {
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController,
                         animated: true,
                         completion: nil)
        }
    }
}
