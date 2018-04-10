import UIKit
import Foundation

public class SettingsViewController: UIViewController {
    
    internal var svm: SettingsViewModel?
    @IBOutlet weak var settingsTableView: UITableView!
    
}

extension SettingsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let vm = svm else { return 0 }
        return vm.settingsArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let emptyCell = UITableViewCell()
        guard let vm = svm else { return emptyCell }
        
        let settingsCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        settingsCell.textLabel?.text = vm.settingsArray[indexPath.row]
        
        tableView.tableFooterView = emptyCell
        
        return settingsCell
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = svm else { return }
        if indexPath.row == 0 {
            
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
            
        }
        else if indexPath.row == 1 {
            
        }
        else if indexPath.row == 2 {
            
        }
    }
    
    
}
