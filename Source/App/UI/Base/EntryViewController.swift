import UIKit

class EntryViewController: UIViewController {

    // MARK: Outlets and Actions
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        breakfastLabel.text = "BREAKFAST"
        lunchLabel.text = "LUNCH"

        breakfastLabel.textColor = .white
        lunchLabel.textColor = .white

    }

}
