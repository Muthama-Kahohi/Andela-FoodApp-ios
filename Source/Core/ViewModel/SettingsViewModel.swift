import Foundation

public enum settingsCells: String {

    case logoutLabel = "Log Out"
    case feedbackLabel = "Send feedback"
    case mealPlanLabel = "Change Meal Plan"
    case privacyText = "Privacy Policy"
    case problemLabel = "Report a problem"
}

public class SettingsViewModel {

    public var cancelText: String
    public var logoutAlertLabel: String
    public var logoutLabel: String
    public var feedbackLabel: String
    public var feedbackScreenId: String
    public var mealPlanLabel: String
    public var privacyText: String
    public var problemLabel: String
    public var reportScreenID: String
    public var settingsArray: [String]
    public var settingsCellsArray = [SettingsCells]()
    public var yesText: String


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

    public func setupSettingsCellsArray () {
        for item in settingsArray {

            let cellObject = SettingsCells(actionName: item)
            settingsCellsArray.append(cellObject)
        }
    }

    public func numOfRowsinSettingsTable() -> Int {

        return settingsCellsArray.count
    }


}
