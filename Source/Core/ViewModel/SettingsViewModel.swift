import Foundation

public enum settingsCellsOptions {

    case logout
    case feedback
    case mealPlan
    case privacy
    case bug
}

public class SettingsViewModel {

    public var cancelText: String
    public var logoutAlertLabel: String
    public var logoutLabel: String
    public var feedbackLabel: String
    public var feedbackScreenId: String
    public var mainStoryboardID: String
    public var mealPlanLabel: String
    public var mealOptionScreenID: String
    public var settingsViewControllerId: String
    public var privacyText: String
    public var problemLabel: String
    public var reportScreenID: String
    public var settingsCellsArray = [SettingsCells]()
    public var yesText: String


    public init() {

        cancelText = "cancel_title".localized
        logoutLabel = "log_out".localized
        feedbackLabel = "feedback".localized
        feedbackScreenId = "feedback_screen_id".localized
        mainStoryboardID = "main_storyboard_id".localized
        mealPlanLabel = "meal_plan_label_text".localized
        mealOptionScreenID = "meal_option_screen_id".localized
        settingsViewControllerId = "settings_screen_id".localized
        privacyText = "privacy_policy_text".localized
        problemLabel = "report_problem".localized
        logoutAlertLabel = "want_to_log_out".localized
        yesText = "yes_title".localized
        reportScreenID = "report_screen_ID".localized
    }

    public func setupSettingsCells() {

        settingsCellsArray = [
            SettingsCells( .mealPlan,
                           mealPlanLabel),
            SettingsCells(.feedback,
                          feedbackLabel),

            SettingsCells(.bug,
                          problemLabel),

            SettingsCells(.privacy,
                          privacyText),

            SettingsCells(.logout,
                          logoutLabel)

        ]
    }

    public func numOfRowsinSettingsTable() -> Int {

        return settingsCellsArray.count
    }


}
