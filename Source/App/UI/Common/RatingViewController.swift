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
    private var index = 1
    private var ratingsList = [Int]()
    private var ratingsDictionary = [String: Int]()

    let today = Date()
    //MARK: Overriden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        commentTextField.delegate = self
        commentTextField.underlined()
        
        dateLabel.textColor = .gray
        dateLabel.text = today.dateToString(date: today)

        tableView.tableFooterView = UIView()
        
        registerForKeyboardNotifications()
    }
    
    //MARK: Private Methods
    
    @IBAction private func doneButtonPressed(_ sender: Any) {
        
        guard
            let vm = viewModel,
            let mealType = vm.mealType
            else { return }
        
        for rating in ratingsList {
            let rowString = String(index)
            ratingsDictionary[rowString] = rating
            index += 1
        }
        
        let rating = Ratings(chefId: 1,
                             comment: self.comment,
                             date: today.dateToString(date: today),
                             mealId: mealType,
                             values: ratingsDictionary)

        vm.writeRatings(rating)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let navigationController = storyboard.instantiateViewController(withIdentifier: "navigationControllerID") as? UINavigationController {
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController,
                        animated: true)
        }
        
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
    
   
}

extension RatingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let emptyCell = UITableViewCell()
        
        guard
            let vm = viewModel else { return emptyCell }
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellName, for: indexPath) as? RatingTableViewCell
            else { return UITableViewCell() }
        
        cell.ratingControl.delegate = self
        
        guard let foodlist = vm.foodList else { return emptyCell }
        let food = foodlist[indexPath.row]
        
        cell.foodNameLabel.text = food.name
        cell.ratingControl.rating = 0
        
        return cell
    }
}

extension RatingViewController {
    
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    private var topViewController: UIViewController {
        guard
            let tvc = appDelegate?.window?.rootViewController else { return UIViewController() }
        return tvc
    }
}
extension RatingViewController: RateMealItemDelegate {
    
    func sendMealRating(rating: Int) {
        self.ratingsList.append(rating)
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
