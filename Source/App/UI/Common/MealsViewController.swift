import FirebaseDatabase
import Firebase


class MealsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealsTable: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var rateButton: CircleButton!

    internal var viewModel: MealsViewModel?
    
    private var mealID: String?
    private var mealItemIDList: [String]?
    private var mealType: String?

    //MARK: Overriden Methods

    override public func viewDidLoad() {
        super.viewDidLoad()

        mealsTable.dataSource = self

        guard
            let vm = viewModel else { return }

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
            self.mealID = vm.mealID
            self.mealItemIDList = vm.foodList.compactMap({ (mealitem) -> String in
                let idList = mealitem.id
                return idList
            })
            self.mealType = vm.mealType
        }
        
        self.mealsTable.tableFooterView = UIView()
        self.mealsTable.separatorStyle = .none
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRatingsSegue" {

            if let nextVC = segue.destination as? RatingViewController {
                let rvm: RatingViewModel = RatingViewModel()
                nextVC.viewModel = rvm
                nextVC.viewModel?.foodList = viewModel?.foodList
                nextVC.viewModel?.mealID = self.mealID
                nextVC.viewModel?.mealItemIDList = self.mealItemIDList
                nextVC.viewModel?.mealType = self.mealType
            }
        }
    }
}

extension MealsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let vm = viewModel else { return 0 }

        return vm.foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let emptyCell = UITableViewCell()

        guard let vm = viewModel else { return emptyCell }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellIdentifier, for: indexPath) as? MealsTableViewCell
            else { return UITableViewCell() }
        
        let food = vm.foodList[indexPath.row]
        let name = food.name
        let index = name.index(name.startIndex, offsetBy: 0)
        
        cell.letterLabel.text = String(describing: name[index])
        cell.mealName.text = name
        
        return cell
    }
}
