import Foundation

public enum mealOptionSourceScreens: String {

    case settingsViewControllerID
    case signInViewControllerID
}
public class MealOptionsViewModel {

    // Public Properties

    public let breakfastButtonLabel: String
    public let cancelTitle: String
    public let confirmMessage: String
    public let confirmTitle: String
    public let dinnerButtonLabel: String
    public let instructionLabelText: String
    public let lunchButtonLabel: String
    public let mainStoryboardID: String
    public let navigationScreenID: String
    public let navigationTitle: String
    public let submitButtonLabel: String
    public let questionLabelText: String
    public let welcomeLabelText: String
    public let yesTitle: String


    // MARK: Public Initializer

    public init() {

        breakfastButtonLabel = "breakfast_title".localized
        cancelTitle = "alert_action_cancel_title".localized
        confirmMessage = "confirm_message".localized
        confirmTitle = "confirm_title".localized
        dinnerButtonLabel = "dinner_title".localized
        instructionLabelText = "instruction_text".localized
        lunchButtonLabel = "lunch_title".localized
        mainStoryboardID = "main_storyboard_id".localized
        navigationTitle = "nav_title".localized
        navigationScreenID = "navigation_controller_1_id".localized
        submitButtonLabel = "submit_label".localized
        questionLabelText = "questionText".localized
        welcomeLabelText = "welcome_text".localized
        yesTitle = "alert_action_yes_title".localized
    }

    private func getUserName() -> String? {

        guard let email = FoodAppClient.email else { return nil }
        return email.userNameFromEmail
    }

    public func getwelcomeText () -> String {

        guard let userName = getUserName() else { return "" }
        return "\(welcomeLabelText) \(userName)"
    }
}
