import FirebaseDatabase
import Firebase


class MealsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealsTable: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var rateButton: CircleButton!

    internal var mvm: MealsViewModel?
    var mealType: String?
    var ref: DatabaseReference?
    var handle: DatabaseHandle?

    //MARK: Overriden Methods

    override public func viewDidLoad() {
        super.viewDidLoad()

        mealsTable.dataSource = self

        guard
            let vm = mvm else { return }

        let today = Date()

        dateLabel.text = today.dateToString(date: today)

        loader.color = .black
        loader.startAnimating()

        self.rateButton.isEnabled = false
        
        vm.populateFoodList {
            self.loader.color = .clear
            self.loader.stopAnimating()
            self.mealsTable.reloadData()
            self.rateButton.isEnabled = true
        }
        
        self.mealType = vm.mealType
        self.mealsTable.tableFooterView = UIView()
        self.mealsTable.separatorStyle = .none
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRatingsSegue" {

            if let nextVC = segue.destination as? RatingViewController {
                let rvm: RatingViewModel = RatingViewModel()
                nextVC.viewModel = rvm
                nextVC.viewModel?.foodList = mvm?.foodList
                nextVC.viewModel?.mealType = self.mealType
            }
        }
    }
}

extension MealsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let vm = mvm else { return 0}

        return vm.foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let emptyCell = UITableViewCell()

        guard let vm = mvm else { return emptyCell}

        guard let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellIdentifier, for: indexPath) as? MealsTableViewCell
            else { return UITableViewCell() }

        let food = vm.foodList[indexPath.row]
        let foodName = food.name
        let index = food.name.index(foodName.startIndex, offsetBy: 0)
        let foodLetter = String(describing: foodName[index])

        cell.letterLabel.text = foodLetter
        cell.mealName.text = foodName

        return cell
    }
}
