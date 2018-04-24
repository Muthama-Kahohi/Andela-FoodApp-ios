
import UIKit

class MealOptionsViewController: UIViewController {

    //MARK: Internal Methods

    internal var movm: MealOptionsViewModel?

    //MARK: Public Properties

    var buttonTaps: Int = 0

    //MARK: IBOutlets

    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var dinnerButton: UIButton!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var lunchButton: UIButton!
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

    @IBAction private func submitButtonTapped(_ sender: UIButton) {
    }

    @IBAction func breakfastButtonTapped(_ sender: UIButton) {
        calculateTaps(sender)
    }

    @IBAction func lunchButtonTapped(_ sender: UIButton) {
        calculateTaps(sender)
    }

    @IBAction func dinnerButtonTapped(_ sender: UIButton) {
        calculateTaps(sender)
    }

    private func calculateTaps(_ sender: UIButton) {

        if sender.isSelected {
            buttonTaps -= 1
        } else {

            buttonTaps += 1
        }
    }
    private func setupView() {

        guard let vm = movm else {
            return
        }
        // Setup the label

        breakfastLabel.text = vm.breakfastButtonLabel
        dinnerLabel.text = vm.dinnerButtonLabel
        hiLabel.text = vm.welcomeLabelText
        instructionLabel.text = vm.instructionLabelText
        lunchLabel.text = vm.lunchButtonLabel
        navTitle.text = vm.navigationTitle
        submitButton.titleLabel?.text = vm.submitButtonLabel
        questionLabel.text = vm.questionLabelText

        //Set up the buttons

//        breakfastButton.isEnabled = false
//        lunchButton.isEnabled = false
//        dinnerButton.isEnabled = false
    }
}
