import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var signIn: GIDSignInButton!

    override func viewDidLoad() {

        super.viewDidLoad()

        signIn.style = .wide

        //Intialize the sign in

        guard let FirApp = FirebaseApp.app() else { return }

        GIDSignIn.sharedInstance().clientID = FirApp.options.clientID
        GIDSignIn.sharedInstance().hostedDomain = "andela.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }

    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {

        if let error = error {

            print ("\(error.localizedDescription)")
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let viewController = storyboard.instantiateViewController(withIdentifier: "entryViewControllerID") as? EntryViewController {
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController,
                         animated: false,
                         completion: nil)
        }
    }

}

