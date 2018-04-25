import Foundation


public class MealOptionsViewModel {

    // Public Properties

    public var breakfastButtonLabel: String
    public var dinnerButtonLabel: String
    public var instructionLabelText: String
    public var lunchButtonLabel: String
    public var navigationTitle: String
    public var submitButtonLabel: String
    public var questionLabelText: String
    public var welcomeLabelText: String


    // MARK: Public Initializer

    public init() {

        breakfastButtonLabel = "breakfast_title".localized
        dinnerButtonLabel = "dinner_title".localized
        instructionLabelText = "instruction_text".localized
        lunchButtonLabel = "lunch_title".localized
        navigationTitle = "nav_title".localized
        submitButtonLabel = "submit_label".localized
        questionLabelText = "questionText".localized
        welcomeLabelText = "welcome_text".localized
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
