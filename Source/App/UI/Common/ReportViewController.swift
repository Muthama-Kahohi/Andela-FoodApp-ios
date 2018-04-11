
import UIKit

class ReportViewController: UIViewController {

    //MARK: Internal Properties

    internal var rvm: ReportViewModel?

    //MARK: IBOutlets

    @IBOutlet weak var Xbutton: UIButton!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tickButtonButton: UIButton!

    @IBOutlet weak var helpTextLabel: UILabel!
    @IBOutlet weak var reportTextField: UITextField!

    @IBOutlet weak var extraCommentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = rvm else { return }
    }
}

extension ReportViewController: UINavigationBarDelegate {


}
