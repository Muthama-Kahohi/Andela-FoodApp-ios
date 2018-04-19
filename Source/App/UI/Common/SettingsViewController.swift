import UIKit
import Foundation

public class SettingsViewController: UIViewController {

    internal var viewModel: SettingsViewModel?
    
    @IBOutlet weak var settingsTableView: UITableView!

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension SettingsViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard
            let vm = viewModel else { return 0 }
        return vm.settingsArray.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let emptyCell = UITableViewCell()
        guard
            let vm = viewModel else { return emptyCell }

        let settingsCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)

        settingsCell.textLabel?.text = vm.settingsArray[indexPath.row]

        tableView.tableFooterView = emptyCell

        return settingsCell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70.0
    }
}

extension SettingsViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let vm = viewModel else { return }
        let row = indexPath.row

        switch row {

        case 0 :

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
        case 1 :

            guard
                let vm = viewModel else { return }

            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let fvc = sb.instantiateViewController(withIdentifier: vm.feedbackScreenId ) as? FeedbackViewController else { return }

            let fvm = FeedbackViewModel()
            fvc.viewModel = fvm

            present(fvc,
                    animated: true,
                    completion: nil)


        case 2 :

            guard
                let vm = viewModel else { return }

            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let rvc = sb.instantiateViewController(withIdentifier: vm.reportScreenID ) as? ReportViewController else { return }

            let rvm = ReportViewModel()
            rvc.rvm = rvm

            present(rvc,
                    animated: true,
                    completion: nil)

        default:

            print(" Will not segue ")
        }
    }
}
