import UIKit

class RatingViewController: UIViewController {

    //MARK: IBOutlets

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var commentsTextfieldBottomConstraint: NSLayoutConstraint!

    //MARK: Internal Properties

    internal var viewModel: RatingViewModel?

    //MARK: Private properties

    private var comment: String = ""
    private var ratingsDictionary = [String: Int]()

    //MARK: Overriden methods

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let vm = viewModel else { return }
        
        tableView.delegate = self
        tableView.dataSource = self

        commentTextField.delegate = self
        commentTextField.underlined()

        dateLabel.textColor = .gray
        dateLabel.text = vm.getCurrentDate()

        tableView.tableFooterView = UIView()

        registerForKeyboardNotifications()
    }

    //MARK: Private Methods

    @IBAction private func doneButtonPressed(_ sender: Any) {

        guard
            let vm = viewModel,
            let mealType = vm.mealType
            else { return }

        let rating = Ratings(chefId: 1,
                             comment: self.comment,
                             date: vm.getCurrentDate(),
                             mealId: mealType,
                             values: ratingsDictionary)

        vm.writeRatings(rating)
        
    }


    // MARK: Keyboard Handling Methods

    private func registerForKeyboardNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }

    private func adjustingHeight(showing: Bool, notification: NSNotification) {

        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }

        guard let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }

        let changeInHeight = keyboardSize.height * (showing ? 1 : -1)


        UIView.animate(withDuration: animationDuration,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        self.view.transform = CGAffineTransform(translationX: 0, y: changeInHeight)

        },
                       completion: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification)  {

        doneButton.isEnabled = false
        adjustingHeight(showing: false, notification: notification)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        doneButton.isEnabled = true
        adjustingHeight(showing: false, notification: notification)
    }
}

extension RatingViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let vm = viewModel else { return 0}
        guard let foodlist = vm.foodList else { return 0 }

        return foodlist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let emptyCell = UITableViewCell()

        guard let vm = viewModel else { return emptyCell}

        guard let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellName, for: indexPath) as? RatingTableViewCell
            else { return UITableViewCell() }

        guard let foodlist = vm.foodList else { return emptyCell }
        let food = foodlist[indexPath.row]

        cell.foodNameLabel.text = food.name
        cell.ratingControl.rating = 0

        return cell
    }
}

extension RatingViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! RatingTableViewCell
        let rowString = String(indexPath.row)
        ratingsDictionary[rowString] = cell.ratingControl.rating
    }
}

extension RatingViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let comment = textField.text else { return }

        self.comment = comment
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        UIView.animate(withDuration: 0.25) {

            self.view.transform = .identity
        }

        return true
    }
}

extension UITextField {

    public func underlined() {

        let border = CALayer()
        let width = CGFloat(0.5)

        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width

        self.borderStyle = .none
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
