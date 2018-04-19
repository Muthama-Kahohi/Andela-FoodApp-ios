
import UIKit

class MealOptionsViewController: UIViewController {

    //MARK: Internal Methods

    internal var movm: MealOptionsViewModel?

    //MARK: IBOutlets

    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!

    //MARK: Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setupView()
    }

    override func viewDidLayoutSubviews() {

        super.viewDidLayoutSubviews()
        let theWidth = view.frame.size.width
        navBar.frame = CGRect.init(x: 0, y: 0, width: theWidth, height: 110000)

    }

    //Private Methods

    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }

    @IBAction private func checkBoxButtonTapped(_ sender: UIButton) {


    }

    private func setupView() {

        guard let vm = movm else {
            return
        }

        breakfastLabel.text = vm.breakfastButtonLabel
        dinnerLabel.text = vm.dinnerButtonLabel
        hiLabel.text = vm.welcomeLabelText
        instructionLabel.text = vm.instructionLabelText
        lunchLabel.text = vm.lunchButtonLabel
        navTitle.text = vm.navigationTitle
        submitButton.titleLabel?.text = vm.submitButtonLabel
        questionLabel.text = vm.questionLabelText
    }
}
