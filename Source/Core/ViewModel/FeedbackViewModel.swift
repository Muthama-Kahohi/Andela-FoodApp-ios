import UIKit

public class FeedbackViewModel {
    
    //MARK: Private Properties
    
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }

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

        dismissTitle = "alert_action_dismiss_title".localized
        feedbackExtraLabelText = "feedback_prompt_explain".localized
        feedbackTextFieldPlaceHolder = "feedback_prompt".localized
        mainStoryBoardId = "main_storyboard_id".localized
        navBarTitle = "feedback_screen_title".localized
        navControllerID = "navigation_controller_1_id".localized
        settingsViewControllerID = "settings_screen_id".localized
        thankYouMessage = "feedback_alert_message".localized
        thankYouTitle = "feedback_alert_title".localized
    }
    
    public func writeFeedback(_ feedback: Feedback) {
        
        self.appDelegate?.foodAppClient.submitFeedback(feedback)
    }
}
