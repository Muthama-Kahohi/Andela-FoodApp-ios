import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signIn: GIDSignInButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    private func updateSigninButton() {

        signIn.colorScheme = .dark
    }
}

