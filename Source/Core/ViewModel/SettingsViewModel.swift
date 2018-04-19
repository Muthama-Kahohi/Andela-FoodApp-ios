import Foundation

public class SettingsViewModel {

    public var cancelText: String
    public var logoutAlertLabel: String
    public var logoutLabel: String
    public var feedbackLabel: String
    public var feedbackScreenId: String
    public var mealPlanLabel: String
    public var privacyText: String
    public var problemLabel: String
    public var settingsArray: [String]
    public var yesText: String
    public var reportScreenID: String

    public init() {

        cancelText = "cancel_title".localized
        logoutLabel = "log_out".localized
        feedbackLabel = "feedback".localized
        feedbackScreenId = "feedback_screen_id".localized
        mealPlanLabel = "meal_plan_label_text".localized
        privacyText = "privacy_policy_text".localized
        problemLabel = "report_problem".localized
        logoutAlertLabel = "want_to_log_out".localized
        yesText = "yes_title".localized
        reportScreenID = "report_screen_ID".localized

        settingsArray = [mealPlanLabel, feedbackLabel, problemLabel, privacyText, logoutLabel]
    }

}
