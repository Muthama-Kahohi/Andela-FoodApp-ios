
import UIKit

class ReportViewController: UIViewController {

    //MARK: Internal Properties

    internal var viewModel: ReportViewModel?
    
    //MARK: Private instance properties
    
    private let today = Date()
    private var comment: String?

    //MARK: IBOutlets

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var extraCommentLabel: UILabel!
    @IBOutlet weak var reportTextField: UITextField!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tickButtonButton: UIButton!
    @IBOutlet weak var Xbutton: UIButton!
    
    //MARK: Overriden methods

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = viewModel else { return }

        // Set up the textfield to be underlined

        doneButton.isEnabled = false
        reportTextField.delegate = self
        reportTextField.placeholder = vm.reportHelpText
        reportTextField.underlined()

        // Set up the labels

        extraCommentLabel.text = vm.reportExplanationText
        screenTitleLabel.text = vm.navBarTitle


    }
    // MARK: Private Methods

    @IBAction private func xbuttonTapped(_ sender: UIButton) {

        goBackToSettings()
    }

    @IBAction func tickButtonTapped(_ sender: UIButton) {

        guard
            let vm = viewModel,
            let email = FoodAppClient.email,
            let userID = FoodAppClient.currentUserID,
            let comment = self.comment
        else { return }
        
        let report = Feedback(date: today.dateToIsoFormat(date: today),
                                email: email,
                                message: comment,
                                userID: userID)
        
        vm.writeReport(report)

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

        guard let vm = viewModel else { return }

        let sb = UIStoryboard(name: vm.mainStoryBoardId, bundle: nil)

        guard let navCon = sb.instantiateViewController(withIdentifier: vm.navControllerID) as? UINavigationController else { return }
        guard let svc = sb.instantiateViewController(withIdentifier: vm.settingsViewControllerID) as? SettingsViewController else  { return }

        
        svc.viewModel = SettingsViewModel()

        navCon.pushViewController(svc,
                                  animated: true)

        present(navCon,
                animated: true)
    }
}

extension ReportViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField,
                                reason: UITextFieldDidEndEditingReason) {
        guard
            let comment = textField.text
            else { return }
        
        self.comment = comment
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        doneButton.isEnabled = true
        return true
    }
}

