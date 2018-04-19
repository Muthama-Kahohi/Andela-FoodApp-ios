import UIKit

class FeedbackViewController: UIViewController {

    //MARK: Internal Varoiables

    internal var viewModel: FeedbackViewModel?

    @IBOutlet weak var feedbackTextField: UITextField!
    @IBOutlet weak var feedbackExplanationLabel: UILabel!
    @IBOutlet weak var screenTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = viewModel else {
            return
        }

        feedbackExplanationLabel.text = vm.feedbackExtraLabelText

        feedbackTextField.underlined()
        feedbackTextField.placeholder = vm.feedbackTextFieldPlaceHolder

        screenTitle.text = vm.navBarTitle
    }

    //MARK: Private Methods

    private func goBackToSettings() {

        guard
            let vm = self.viewModel else { return }

        let sb = UIStoryboard(name: vm.mainStoryBoardId, bundle: nil)

        guard
            let navCon = sb.instantiateViewController(withIdentifier: vm.navControllerID) as? UINavigationController,
            let svc = sb.instantiateViewController(withIdentifier: vm.settingsViewControllerID) as? SettingsViewController
        else  { return }

        let viewModel = SettingsViewModel()
        svc.viewModel = viewModel

        navCon.pushViewController(svc,
                                  animated: true)

        present(navCon, animated: true, completion: nil)
    }

    @IBAction private func xButtonTapped(_ sender: UIButton) {

        goBackToSettings()
    }

    @IBAction private func tickButtonTapped(_ sender: UIButton) {

        guard
            let vm = viewModel else { return }

        let alert = UIAlertController(title: vm.thankYouTitle,
                                      message: vm.thankYouMessage,
                                      preferredStyle: .alert)

        let alertAction = UIAlertAction(title: vm.dismissTitle,
                                        style: .default,
                                        handler: { _ in

                                            self.goBackToSettings()
        })

        alert.addAction(alertAction)
        present(alert,
                animated: true)
    }

}
