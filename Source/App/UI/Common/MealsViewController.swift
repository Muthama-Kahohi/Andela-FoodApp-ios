import UIKit
import FirebaseDatabase
import Firebase

class MealsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealsTable: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var rateButton: CircleButton!

    let mvm: MealsViewModel = MealsViewModel()

    var mealType: String?
    var ref: DatabaseReference?
    var handle: DatabaseHandle?

    //MARK: Overriden Methods

    override public func viewDidLoad() {
        super.viewDidLoad()

        mealsTable.dataSource = self

        dateLabel.text = mvm.displayCurrentDate()

        loader.color = .black
        loader.startAnimating()

        rateButton.isEnabled = false

        self.mvm.loadSampleMeal(){ mealsList in
            self.mvm.populateFoodList(mealIds: mealsList) {
                self.loader.color = .clear
                self.loader.stopAnimating()
                self.mealsTable.reloadData()
                self.rateButton.isEnabled = true
            }
        }

        self.mealsTable.tableFooterView = UIView()
        self.mealsTable.separatorStyle = .none
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRatingsSegue" {

            if let nextVC = segue.destination as? RatingViewController {
                let rvm: RatingViewModel = RatingViewModel()
                nextVC.viewModel = rvm
                nextVC.viewModel?.foodList = mvm.foodList
            }
        }
    }
}

extension MealsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mvm.foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: mvm.cellIdentifier, for: indexPath) as? MealsTableViewCell
            else { return UITableViewCell() }

        let food = mvm.foodList[indexPath.row]
        let foodName = food.name
        let index = food.name.index(foodName.startIndex, offsetBy: 0)
        let foodLetter = String(describing: foodName[index])

        cell.letterLabel.text = foodLetter
        cell.mealName.text = foodName

        return cell
    }
}
