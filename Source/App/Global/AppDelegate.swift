import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var currentUserID: String?
    var currentUser: User?
    var email: String?
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

extension Bundle {
    var apiBaseURL: String {
        return object(forInfoDictionaryKey: "serverBaseURL") as? String ?? ""
    }
}



