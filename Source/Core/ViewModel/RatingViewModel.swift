import UIKit

public class RatingViewModel {

    //MARK: Private Properties

    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }

    var foodList: [MealItem]?
    var mealType: String?

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
    
    public func writeRatings(_ ratings: Ratings) {
        
        self.appDelegate?.foodAppClient.submitRatings(ratings)
    }
}
