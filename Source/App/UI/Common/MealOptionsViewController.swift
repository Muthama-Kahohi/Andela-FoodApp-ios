
import UIKit

class MealOptionsViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {

        super.viewDidLayoutSubviews()
        let theWidth = view.frame.size.width
        navBar.frame = CGRect.init(x: 0, y: 0, width: theWidth, height: 110000)

    }

}
