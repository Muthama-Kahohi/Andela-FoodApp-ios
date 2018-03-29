import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController,
                            GIDSignInUIDelegate {
        
    // MARK: UIOutlets
    
    @IBOutlet public weak var signIn: GIDSignInButton!
    
    // MARK: Internal Properties
    
    internal var viewModel: SignInViewModel = SignInViewModel()
    
    // MARK: Public Instance Methods
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        signIn.style = .wide
        
        //Intialize the sign in
        
        guard let instance = GIDSignIn.sharedInstance() else { return }
        
        instance.hostedDomain = viewModel.domain
        instance.uiDelegate = self
        instance.signInSilently()
        
    }
}


