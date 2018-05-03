import UIKit

public class ReportViewModel {
    
    //MARK: Private Properties
    
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }

    //MARK: Public properties

    public var dismissTitle: String
    public var mainStoryBoardId: String
    public var navBarTitle: String
    public  var navControllerID: String
    public var reportExplanationText: String
    public var reportHelpText: String
    public var settingsViewControllerID: String
    public var thankYouMessage: String
    public var thankYouTitle: String

    //MARK: Public Init

    public init () {

        dismissTitle = "alert_action_dismiss_title".localized
        mainStoryBoardId = "main_storyboard_id".localized
        navBarTitle = "report_screen_title".localized
        navControllerID = "navigation_controller_1_id".localized
        reportExplanationText = "report_prompt_explain".localized
        reportHelpText = "report_prompt".localized
        settingsViewControllerID = "settings_screen_id".localized
        thankYouMessage = "report_alert_message".localized
        thankYouTitle = "report_alert_title".localized
    }
    
    public func writeReport(_ report: Feedback) {
        
        self.appDelegate?.foodAppClient.submitReport(report)
    }
}
