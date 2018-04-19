import Foundation

public class EntryViewModel {

    //MARK: Public Properties

    public var breakfastID: String
    public var defaultText: String
    public var lunchID: String
    public var navigationBarTitle: String
    public var settingsButtonText: String


    //MARK: Public Initializers

    public init() {

        breakfastID = "breakfast_unique_id".localized
        defaultText = "default_case_text".localized
        lunchID = "lunch_unique_id".localized
        settingsButtonText = "settings_title".localized
        navigationBarTitle = "entry_navigation_bar_title".localized
    }
}
