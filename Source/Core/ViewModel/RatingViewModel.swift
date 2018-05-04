import UIKit

public class RatingViewModel {

    //MARK: Private Properties

    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }

    //MARK: Public properties

    public let cellName = "foodCell"
    public var foodList: [MealItems]?
    public let mainStoryboardID = "main_storyboard_id".localized
    public var mealID: String?
    public var mealItemIDList: [String]?
    public var mealType: String?
    public let navigationControllerID = "navigationControllerID".localized

    //MARK: Public Methods
    
    public func writeRatings(_ ratings: Ratings) {
        
        self.appDelegate?.foodAppClient.submitRatings(ratings)
    }
    
    public func writeComments(_ comment: Comments) {
        
        self.appDelegate?.foodAppClient.submitComment(comment)
    }
}
