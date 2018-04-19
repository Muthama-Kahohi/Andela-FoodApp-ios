import UIKit

public enum seguesFromLandingScreen: String {

    case breakfastSegue
    case lunchSegue
    case settingsSegue
}

public class EntryViewController: UIViewController {

    // IBoutlets

    @IBOutlet weak var toSettingsButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!

    // MARK: Private Instance Methods
    
    private let mvm = MealsViewModel()
    private let evm = EntryViewModel()

    //MARK: Overriden Methods

    override public func viewDidLoad() {

        navigationBar.title = evm.navigationBarTitle
        toSettingsButton.titleLabel?.text = evm.settingsButtonText
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let segueID = segue.identifier
        switch segueID {

        case seguesFromLandingScreen.breakfastSegue.rawValue?:
            if let mealsVC = segue.destination as? MealsViewController {

                
                mealsVC.viewModel = mvm
                mealsVC.viewModel?.uniqueFetchID = evm.breakfastID
            }

        case seguesFromLandingScreen.lunchSegue.rawValue?:

            if let mealsVC = segue.destination as? MealsViewController {

                mealsVC.viewModel = mvm
                mealsVC.viewModel?.uniqueFetchID = evm.lunchID
            }

        case seguesFromLandingScreen.settingsSegue.rawValue?:
            if let settingsVC = segue.destination as? SettingsViewController {

                let viewModel = SettingsViewModel()
                settingsVC.viewModel = viewModel
            }
        default:

            print(evm.defaultText)
        }
    }
    @IBAction func extraButtonItem(_ sender: Any) {

        toSettingsButton.isHidden = !toSettingsButton.isHidden
    }

    @IBAction func settingsButtonTapped(_ sender: UIButton) {

        toSettingsButton.isHidden = !toSettingsButton.isHidden

       performSegue(withIdentifier: seguesFromLandingScreen.settingsSegue.rawValue, sender: toSettingsButton)
    }
}


