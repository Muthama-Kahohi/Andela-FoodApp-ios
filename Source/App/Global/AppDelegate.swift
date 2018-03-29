import UIKit
import GoogleSignIn
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var currentUserId: String = ""
    var currentUser: User? = nil
    let foodAppClient = FoodAppClient()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
            guard
                let firebaseConfig = Bundle.main.path(forResource: "GoogleService-Info-dev", ofType: "plist")
                else { fatalError("Firebase Configuration not found")}
        #else
            guard
                let firebaseConfig = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
                else { fatalError("Firebase Configuration not found")}
        #endif

        guard
            let options = FirebaseOptions(contentsOfFile: firebaseConfig)
            else { fatalError("Invalid Firebase configuration file.")}

        FirebaseApp.configure(options: options)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
}

extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        if let error = error {
            print("\(error.localizedDescription)")
            
        } else {
            guard
                let authentication = user.authentication else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                }
                if let user = user {
                    self.currentUser = user
                    self.currentUserId = user.uid
                }
            })
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let navigationController = storyboard.instantiateViewController(withIdentifier: "navigationController") as? UINavigationController {
                navigationController.modalPresentationStyle = .overFullScreen
                self.window?.rootViewController?.present(navigationController,
                             animated: true,
                             completion: nil)
            }
        }
    }
}

extension Bundle {
    var apiBaseURL: String {
        return object(forInfoDictionaryKey: "serverBaseURL") as? String ?? ""
    }
}



