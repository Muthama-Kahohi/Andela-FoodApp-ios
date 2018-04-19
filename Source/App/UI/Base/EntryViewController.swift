import UIKit

public enum seguesFromLandingScreen: String {

    case breakfastSegue
    case lunchSegue
    case settingsSegue
}

public class EntryViewController: UIViewController {
    
    // MARK: Private Instance Methods
    
    private let viewModel = MealsViewModel()

    //MARK: Overriden Methods

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let segueID = segue.identifier
        switch segueID {

        case seguesFromLandingScreen.breakfastSegue.rawValue?:
            if let mealsVC = segue.destination as? MealsViewController {

                
                mealsVC.viewModel = viewModel
                mealsVC.viewModel?.uniqueFetchID = "breakfast"
            }

        case seguesFromLandingScreen.lunchSegue.rawValue?:

            if let mealsVC = segue.destination as? MealsViewController {

                let viewModel = MealsViewModel()
                mealsVC.viewModel = viewModel
                mealsVC.viewModel?.uniqueFetchID = "lunch"
            }

        case seguesFromLandingScreen.settingsSegue.rawValue?:
            if let settingsVC = segue.destination as? SettingsViewController {

                let viewModel = SettingsViewModel()
                settingsVC.viewModel = viewModel
            }
        default:

            print("Cannot segue")
        }
    }
}


