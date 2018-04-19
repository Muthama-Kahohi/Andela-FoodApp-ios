import UIKit

public class RatingViewModel {

    //MARK: Private Properties

    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }

    var foodList: [MealItems]?
    var mealID: String?
    var mealItemIDList: [String]?
    var mealType: String?

    //MARK: Public properties

    public let cellName = "foodCell"

    //MARK: Public Methods
    
    public func writeRatings(_ ratings: Ratings) {
        
        self.appDelegate?.foodAppClient.submitRatings(ratings)
    }
    
    public func writeComments(_ comment: Comments) {
        
        self.appDelegate?.foodAppClient.submitComment(comment)
    }
}
