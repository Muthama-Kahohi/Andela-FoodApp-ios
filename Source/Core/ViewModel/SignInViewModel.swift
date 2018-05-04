import Foundation

public class SignInViewModel {
    
    // MARK: Public Instance Properties
    
    public let domain: String
    public let mainStoryboardID: String
    public let mealOptionScreenID: String
    public let navigationViewControllerID: String
    public let nilText: String
    public let signInButtonTitle: String
    public let signInScreenID: String
    
    // MARK: Public Initializers
    
    public init() {
        
        domain = "domain".localized
        mainStoryboardID = "main_storyboard_id".localized
        mealOptionScreenID = "meal_option_screen_id".localized
        navigationViewControllerID = "navigation_controller_1_id".localized
        nilText = "nil_text".localized
        signInScreenID = "sign_in_screen_id".localized
        signInButtonTitle = "signin_button_title".localized
    }
}
