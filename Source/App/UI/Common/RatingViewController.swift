import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    var foodList = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        commentTextField.delegate = self

        dateLabel.textColor = .gray
        dateLabel.text = displayCurrentDate()
        loadSampleMeal() //dummy data

        registerForKeyboardNotifications()
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
    }

    // MARK: Private Methods
    private func displayCurrentDate() -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter.string(from: now)
    }

    private func loadSampleMeal() {

        let sampleFood = Food(name: "Ugali", rating: 4)
        let sampleFood1 = Food(name: "Spinach", rating: 1)
        let sampleFood2 = Food(name: "Mbuzi Fry", rating: 5)
        let sampleFood3 = Food(name: "Mixed Veggies", rating: 3)
        let sampleFood4 = Food(name: "Mukimo", rating: 2)

        foodList += [sampleFood, sampleFood1, sampleFood2, sampleFood3, sampleFood4]
        //let sampleMeal = Meal(foodList: foodList)
    }

    // MARK: UITableView Delegate/DataSource methods
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? RatingTableViewCell
            else { return UITableViewCell() }

        let food = foodList[indexPath.row]

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
