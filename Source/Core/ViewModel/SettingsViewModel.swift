import Foundation

public class SettingsViewModel {

    public var cancelText: String
    public var logoutAlertLabel: String
    public var logoutLabel: String
    public var feedbackLabel: String
    public var problemLabel: String
    public var settingsArray: [String]
    public var yesText: String

    public init() {

        cancelText = NSLocalizedString("cancel_title", comment: "")
        logoutLabel = NSLocalizedString("log_out", comment: "")
        feedbackLabel = NSLocalizedString("feedback", comment: "")
        problemLabel = NSLocalizedString("report_problem", comment: "")
        logoutAlertLabel = NSLocalizedString("want_to_log_out", comment: "")
        yesText = NSLocalizedString("yes_title", comment: "")

        settingsArray = [logoutLabel, feedbackLabel, problemLabel]
    }

}
