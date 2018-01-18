import UIKit

class MealsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealsTable: UITableView!

    @IBOutlet weak var rateButton: CircleButton!

    let viewModel: MealsViewModel = MealsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        mealsTable.delegate = self
        mealsTable.dataSource = self

        dateLabel.text = viewModel.displayCurrentDate()
        viewModel.loadSampleMeal()

        mealsTable.tableFooterView = UIView()
        mealsTable.separatorStyle = .none

        mealsTable.reloadData()
    }

    // MARK: TableView Delegate Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as? MealsTableViewCell
            else { return UITableViewCell() }

        let food = viewModel.foodList[indexPath.row]
        let foodName = food.name
        let index = food.name.index(foodName.startIndex, offsetBy: 0)
        let foodLetter = String(describing: foodName[index])

        cell.letterLabel.text = foodLetter
        cell.mealName.text = foodName

        return cell
    }
}
