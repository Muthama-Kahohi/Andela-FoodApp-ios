import UIKit
import Foundation

public class SettingsViewController: UIViewController {

    //MARK: Internal Variables

    internal var viewModel: SettingsViewModel?

    //MARK: IBoutlets

    @IBOutlet weak var settingsTableView: UITableView!

    //MARK: Overriden Methods

    override public func viewDidLoad() {
        super.viewDidLoad()

        guard let svm = viewModel else {
            return }

        svm.setupSettingsCells()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
//MARK: SettingsViewController Extensions

extension SettingsViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let vm = viewModel else {
            return 0 }

        return vm.numOfRowsinSettingsTable()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let emptyCell = UITableViewCell()
        guard
            let vm = viewModel else { return emptyCell }

        let settingsCell = tableView.dequeueReusableCell(withIdentifier: vm.settingsCellIdentifier, for: indexPath)


        settingsCell.textLabel?.text = vm.settingsCellsArray[indexPath.row].settingCellLabel

        tableView.tableFooterView = emptyCell

        return settingsCell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70.0
    }
}

extension SettingsViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let vm = viewModel else {
            return }

        let rowLabel = vm.settingsCellsArray[indexPath.row].settingsOption

        switch rowLabel {

        case  .logout:

            let alert = UIAlertController(title: vm.logoutLabel ,
                                          message: vm.logoutAlertLabel,
                                          preferredStyle: .alert)

            let alertAction1 = UIAlertAction(title: vm.cancelText,
                                             style: .cancel,
                                             handler: nil)

            let alertAction2 = UIAlertAction(title: vm.yesText,
                                             style: .destructive,
                                             handler: nil)
            alert.addAction(alertAction1)
            alert.addAction(alertAction2)

            present(alert,
                    animated: true,
                    completion: nil)

        case .feedback :

            guard let fvc = FeedbackViewController.instantiate(from: .main) else { return }

            fvc.viewModel = FeedbackViewModel()

            present(fvc,
                    animated: true,
                    completion: nil)

        case .bug :

            guard let rvc = ReportViewController.instantiate(from: .main) else { return }

            rvc.viewModel = ReportViewModel()

            present(rvc,
                    animated: true,
                    completion: nil)

        case .mealPlan:


            guard let movc = MealOptionsViewController.instantiate(from: .main) else { return }

            let movm = MealOptionsViewModel()
            movc.movm = movm
            movc.sourceViewController = .settingsViewControllerID

            present(movc,
                    animated: true,
                    completion: nil)

        case .privacy:

            // Temporary

            print ("Will Segue privacy viewController")
        }
    }
}
