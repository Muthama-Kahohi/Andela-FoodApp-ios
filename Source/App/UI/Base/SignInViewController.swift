import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var signIn: GIDSignInButton!
    override func viewDidLoad() {

        super.viewDidLoad()

        signIn.style = .wide

        //Intialize the sign in
        guard let FirApp = FirebaseApp.app() else { return }
        guard let instance = GIDSignIn.sharedInstance() else { return }

        instance.clientID = FirApp.options.clientID
        instance.hostedDomain = "andela.com"
        instance.uiDelegate = self
        instance.delegate = self
        instance.signInSilently()
    }

    func sign(_ signIn: GIDSignIn!,
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
