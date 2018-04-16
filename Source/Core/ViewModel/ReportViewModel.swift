import Foundation

public class ReportViewModel {

    //MARK: Public properties

    var mainStoryBoardId: String
    var navBarTitle: String
    var navControllerID: String
    var reportExplanationText: String
    var reportHelpText: String
    var settingsViewControllerID: String

    //MARK: Public Init

    public init () {

        mainStoryBoardId = NSLocalizedString("main_storyboard_id", comment: "")
        navBarTitle = NSLocalizedString("report_screen_title", comment: "")
        navControllerID = NSLocalizedString("navigation_controller_1_id", comment: "")
        reportExplanationText = NSLocalizedString("report_prompt_explain", comment: "")
        reportHelpText = NSLocalizedString("report_prompt", comment: "")
        settingsViewControllerID = NSLocalizedString("settings_screen_id", comment: "")
    }

}
