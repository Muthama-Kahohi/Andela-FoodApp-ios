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

    //MARK: Public MethodS
    
    public func writeRatings(_ ratings: Ratings) {
        
        self.appDelegate?.foodAppClient.submitRatings(ratings)
    }
}
