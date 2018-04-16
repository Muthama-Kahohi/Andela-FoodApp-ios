import UIKit

class FeedbackViewController: UIViewController {

    //MARK: Internal Varoiables

    internal var fvm: FeedbackViewModel?

    @IBOutlet weak var feedbackTextField: UITextField!
    @IBOutlet weak var feedbackExplanationLabel: UILabel!
    @IBOutlet weak var screenTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = fvm else {
            return
        }

        feedbackExplanationLabel.text = vm.feedbackExtraLabelText

        feedbackTextField.underlined()
        feedbackTextField.placeholder = vm.feedbackTextFieldPlaceHolder

        screenTitle.text = vm.navBarTitle


    }

    //MARK: Private Methods

    private func goBackToSettings() {

        guard let vm = fvm else {
            return
        }

        let sb = UIStoryboard(name: vm.mainStoryBoardId, bundle: nil)

        guard let navCon = sb.instantiateViewController(withIdentifier: vm.navControllerID) as? UINavigationController else { return }
        guard let svc = sb.instantiateViewController(withIdentifier: vm.settingsViewControllerID) as? SettingsViewController else  { return }

        let svm = SettingsViewModel()
        svc.svm = svm

        navCon.pushViewController(svc,
                                  animated: true)

        present(navCon, animated: true, completion: nil)
    }

    @IBAction private func xButtonTapped(_ sender: UIButton) {

        goBackToSettings()
    }

    @IBAction private func tickButtonTapped(_ sender: UIButton) {

        goBackToSettings()
    }

}