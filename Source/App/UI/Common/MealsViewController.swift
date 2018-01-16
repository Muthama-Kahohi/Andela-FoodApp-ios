import UIKit

class MealsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealsTable: UITableView!
    @IBOutlet weak var rateButton: UIButton!

    var foodList = [MealItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        mealsTable.delegate = self
        mealsTable.dataSource = self
        dateLabel.text = displayCurrentDate()
        loadSampleMeal()
        mealsTable.tableFooterView = UIView()
        mealsTable.reloadData()

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

        let sampleFood = MealItem(name: "Ugali", rating: 4)
        let sampleFood1 = MealItem(name: "Spinach", rating: 1)
        let sampleFood2 = MealItem(name: "Mbuzi Fry", rating: 5)
        let sampleFood3 = MealItem(name: "Mixed Veggies", rating: 3)
        let sampleFood4 = MealItem(name: "Mukimo", rating: 2)

        foodList += [sampleFood, sampleFood1, sampleFood2, sampleFood3, sampleFood4]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell", for: indexPath) as? MealsTableViewCell
            else { return UITableViewCell() }

        let food = foodList[indexPath.row]
        let foodName = food.name
        let index = food.name.index(foodName.startIndex, offsetBy: 0)
        let foodLetter = String(describing: foodName[index])

        cell.letterLabel.text = foodLetter
        cell.mealName.text = foodName

        return cell
    }
}
