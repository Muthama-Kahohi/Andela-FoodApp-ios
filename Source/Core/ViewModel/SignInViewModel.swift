import Foundation

public class SignInViewModel {
    
    // MARK: Public Instance Properties
    
    public let domain: String
    public let mainStoryboardID: String
    public let mealOptionScreenID: String
    public let signInScreenID: String
    
    // MARK: Public Initializers
    
    public init() {
        
        domain = "domain".localized
        mainStoryboardID = "main_storyboard_id".localized
        mealOptionScreenID = "meal_option_screen_id".localized
        signInScreenID = "sign_in_screen_id".localized
    }
}
