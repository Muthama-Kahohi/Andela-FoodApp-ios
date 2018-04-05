import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    //MARK: IBOutlets

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    //MARK: Internal Properties

    internal var viewModel: RatingViewModel?
    var ratingsDictionary = [String: Int]()
    private var comment: String = ""

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

        guard let vm = viewModel else { return }

        let rating = Ratings(chefId: 1,
                             comment: comment,
                             date: vm.getCurrentDate(),
                             mealId: "Lunch",
                             values: ratingsDictionary)

        vm.writeRatings(rating)
        
    }

    // MARK: UITableView Delegate/DataSource methods

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let vm = viewModel else { return 0}
        guard let foodlist = vm.foodList else { return 0 }

        return foodlist.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RatingTableViewCell
        let rowString = String(indexPath.row)

        ratingsDictionary[rowString] = cell.ratingControl.rating
    }

    // MARK: TextView Tracking Methods

    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let comment = textField.text else { return }
        
        self.comment = comment
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
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
                        self.bottomConstraint.constant += changeInHeight
        },
                       completion: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        adjustingHeight(showing: true, notification: notification)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        adjustingHeight(showing: false, notification: notification)    }
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
