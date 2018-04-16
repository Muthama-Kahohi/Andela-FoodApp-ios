
import UIKit

class ReportViewController: UIViewController {

    //MARK: Internal Properties

    internal var rvm: ReportViewModel?

    //MARK: IBOutlets

    @IBOutlet weak var Xbutton: UIButton!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tickButtonButton: UIButton!

    @IBOutlet weak var reportTextField: UITextField!

    @IBOutlet weak var extraCommentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = rvm else { return }

        // Set up the textfield to be underlined

        reportTextField.underlined()
        reportTextField.placeholder = vm.reportHelpText

        // Set up the labels

        extraCommentLabel.text = vm.reportExplanationText
        screenTitleLabel.text = vm.navBarTitle


    }
    // MARK: Private Methods

    @IBAction private func xbuttonTapped(_ sender: UIButton) {

        goBackToSettings()
    }

    @IBAction func tickButtonTapped(_ sender: UIButton) {

        guard let vm = rvm else { return }

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
                animated: true,
                completion: nil)
    }

    private func goBackToSettings () {

        guard let vm = rvm else {
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
}

