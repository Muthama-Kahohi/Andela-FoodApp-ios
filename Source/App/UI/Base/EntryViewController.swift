import UIKit

class EntryViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "breakfastSegue" {

            if let mealsVC = segue.destination as? MealsViewController {

                let mvm = MealsViewModel()
                mealsVC.mvm = mvm
                mealsVC.mvm?.uniqueFetchId = 1
            }

        } else if segue.identifier == "lunchSegue" {

            if let mealsVC = segue.destination as? MealsViewController {

                let mvm = MealsViewModel()
                mealsVC.mvm = mvm
                mealsVC.mvm?.uniqueFetchId = 2
            }
        }  else if segue.identifier == "settingsSegue" {

            if let settingsVC = segue.destination as? SettingsViewController {

                let svm = SettingsViewModel()
                settingsVC.svm = svm
            }
        }
    }
}
