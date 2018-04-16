import Foundation

public class FeedbackViewModel {

    //MARK: Public properties

    public var dismissTitle: String
    public var feedbackExtraLabelText: String
    public var feedbackTextFieldPlaceHolder: String
    public var mainStoryBoardId: String
    public var navBarTitle: String
    public var navControllerID: String
    public var settingsViewControllerID: String
    public var thankYouMessage: String
    public var thankYouTitle: String


    //MARK: Public Intializers

    public init () {

        dismissTitle = NSLocalizedString("alert_action_dismiss_title", comment: "")
        feedbackExtraLabelText = NSLocalizedString("feedback_prompt_explain", comment: "")
        feedbackTextFieldPlaceHolder = NSLocalizedString("feedback_prompt", comment: "")
        mainStoryBoardId = NSLocalizedString("main_storyboard_id", comment: "")
        navBarTitle = NSLocalizedString("feedback_screen_title", comment: "")
        navControllerID = NSLocalizedString("navigation_controller_1_id", comment: "")
        settingsViewControllerID = NSLocalizedString("settings_screen_id", comment: "")
        thankYouMessage = NSLocalizedString("feedback_alert_message", comment: "")
        thankYouTitle = NSLocalizedString("feedback_alert_title", comment: "")
    }
}
