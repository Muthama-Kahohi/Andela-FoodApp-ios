import UIKit

public class RatingViewModel {

    //MARK: Internal Properties
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    internal var foodList = [MealItem]()
    //internal var ratingsList = [Ratings]()

    //MARK: Public properties

    let cellName = "foodCell"

    //MARK: Public Methods

    public func getCurrentDate() -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter.string(from: now)
    }

    public func loadSampleMeal() {

        let sampleFood = MealItem(id: 1, name: "Ugali")
        let sampleFood1 = MealItem(id: 2, name: "Spinach")
        let sampleFood2 = MealItem(id: 3, name: "Mbuzi Fry")
        let sampleFood3 = MealItem(id: 4, name: "Mixed Veggies")
        let sampleFood4 = MealItem(id: 5, name: "Mukimo")

        foodList += [sampleFood, sampleFood1, sampleFood2, sampleFood3, sampleFood4]
    }
    
    public func writeRatings(_ ratings: Ratings) {
        
        self.appDelegate?.foodAppClient.submitRatings(ratings)
    }
}
