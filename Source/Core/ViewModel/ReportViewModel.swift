import Foundation

public class ReportViewModel {

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

        dismissTitle = NSLocalizedString("alert_action_dismiss_title", comment: "")
        mainStoryBoardId = NSLocalizedString("main_storyboard_id", comment: "")
        navBarTitle = NSLocalizedString("report_screen_title", comment: "")
        navControllerID = NSLocalizedString("navigation_controller_1_id", comment: "")
        reportExplanationText = NSLocalizedString("report_prompt_explain", comment: "")
        reportHelpText = NSLocalizedString("report_prompt", comment: "")
        settingsViewControllerID = NSLocalizedString("settings_screen_id", comment: "")
        thankYouMessage = NSLocalizedString("report_alert_message", comment: "")
        thankYouTitle = NSLocalizedString("report_alert_title", comment: "")
    }

}
