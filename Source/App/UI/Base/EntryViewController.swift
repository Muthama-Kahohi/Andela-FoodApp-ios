import UIKit

public enum seguesFromLandingScreen: String {

    case breakfastSegue
    case lunchSegue
    case settingsSegue
}

public class EntryViewController: UIViewController {

    //MARK: Overriden Methods

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let segueID = segue.identifier
        switch segueID {

        case seguesFromLandingScreen.breakfastSegue.rawValue?:
            if let mealsVC = segue.destination as? MealsViewController {

                let mvm = MealsViewModel()
                mealsVC.mvm = mvm
                mealsVC.mvm?.uniqueFetchID = "breakfast"
            }

        case seguesFromLandingScreen.lunchSegue.rawValue?:

            if let mealsVC = segue.destination as? MealsViewController {

                let mvm = MealsViewModel()
                mealsVC.mvm = mvm
                mealsVC.mvm?.uniqueFetchID = "lunch"
            }

        case seguesFromLandingScreen.settingsSegue.rawValue?:
            if let settingsVC = segue.destination as? SettingsViewController {

                let svm = SettingsViewModel()
                settingsVC.svm = svm
            }
        default:

            print("Cannot segue")
        }
    }
}


