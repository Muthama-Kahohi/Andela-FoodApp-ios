import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    //MARK: IBOutlets

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    //MARK: Internal Properties

    internal var viewModel: RatingViewModel =  RatingViewModel()

    //MARK: Overriden methods

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadSampleMeal()

        tableView.delegate = self
        tableView.dataSource = self

        commentTextField.delegate = self
        commentTextField.underlined()

        dateLabel.textColor = .gray
        dateLabel.text = viewModel.getCurrentDate()

        registerForKeyboardNotifications()
    }

    //MARK: Private Methods

    @IBAction private func doneButtonPressed(_ sender: Any) {
    }

    // MARK: UITableView Delegate/DataSource methods

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.foodList.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellName, for: indexPath) as? RatingTableViewCell
            else { return UITableViewCell() }

        let food = viewModel.foodList[indexPath.row]

        cell.foodNameLabel.text = food.name
        cell.ratingControl.rating = food.rating ?? 0

        return cell
    }

    // MARK: TextView Tracking Methods

    func textFieldDidEndEditing(_ textField: UITextField) {

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
