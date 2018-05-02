import UIKit
import RxSwift

class MealOptionsViewController: UIViewController {

    //MARK: Internal Methods

    internal var movm: MealOptionsViewModel?

    //MARK: Private Properties

    private let buttonTaps = Variable<Int>(0)

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

    //MARK: IBoutlet collection

    @IBOutlet var rateButtons: [UIButton]!

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

        let  buttons = rateButtons.filter{

            $0.isSelected
        }

        let sortedButtons = buttons.sorted{
            $0.tag < $1.tag

        }

        UserDefaults.standard.setMeal1(value: sortedButtons[0].id)
        UserDefaults.standard.setMeal2(value: sortedButtons[1].id)
    }

    @IBAction private func checkButtonTapped(_ sender: UIButton) {

        calculateTaps(sender)
    }

    private func calculateTaps(_ sender: UIButton) {
        let bag = DisposeBag()

        sender.isSelected = !sender.isSelected
        if sender.isSelected {

            buttonTaps.value += 1

        } else {

            buttonTaps.value -= 1

        }

        buttonTaps.asObservable()
            .subscribe{ event in

                if event.element == 2 {

                    _ = self.rateButtons.map{

                        if !$0.isSelected{

                            $0.isEnabled = false
                        }
                    }
                } else {
                    _ = self.rateButtons.map {
                        if !$0.isEnabled  {

                            $0.isEnabled = true
                        }
                    }
                }
            }.disposed(by: bag)
    }

    private func setupView() {

        guard let vm = movm else {
            return
        }
        // Setup the labels

        breakfastLabel.text = vm.breakfastButtonLabel
        dinnerLabel.text = vm.dinnerButtonLabel
        hiLabel.text = vm.getwelcomeText()
        instructionLabel.text = vm.instructionLabelText
        lunchLabel.text = vm.lunchButtonLabel
        navTitle.text = vm.navigationTitle
        submitButton.titleLabel?.text = vm.submitButtonLabel
        questionLabel.text = vm.questionLabelText
    }
}
