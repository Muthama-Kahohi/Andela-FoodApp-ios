import Firebase
import FirebaseAuth
import FirebaseDatabase
import RxSwift

public class FoodAppClient {

    //MARK: Private Constants

    private static  var disposeBag: DisposeBag{

        let bag = DisposeBag()
        return bag
    }
    
    //MARK: Private Instance Methods
    
    static var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    static var currentUser: User? {
        return appDelegate?.currentUser
    }
    
    static var currentUserID: String? {
        return appDelegate?.currentUserID
    }
    
    static var email: String? {

        return self.appDelegate?.userEmail.value
    }
    
    //MARK: Database Instance
    
    static let databaseRef = Database.database().reference()
    
    //MARK: Public Instance Methods
    
    public func submitComment(_ comment: Comments) {
        
        FoodAppClient.databaseRef.child("comments").updateChildValues(["\(comment.date)": [
            "\(comment.mealID)" : [
                "\(comment.userID)" : [
                    "comment": "\(comment.comment)",
                    "email": "\(comment.email)"
                ]]]])
    }
    
    public func submitRatings(_ ratings: Ratings) {
        
        FoodAppClient.databaseRef.child("ratings/\(ratings.date)").updateChildValues(["\(ratings.mealItemID)" : [
            "\(ratings.userID)": [
                "email": "\(ratings.email)",
                "rating": ratings.rating]]])
    }
    
    public func submitFeedback(_ feedback: Feedback) {
        
        FoodAppClient.databaseRef.child("feedback/feature/iPhone").updateChildValues(["\(feedback.date)" : [
            "\(feedback.userID)" : [
                "email": "\(feedback.email)",
                "message": "\(feedback.message)"]]])
    }
    
    public func submitReport(_ report: Feedback) {
        
        FoodAppClient.databaseRef.child("feedback/bug/iPhone").updateChildValues(["\(report.date)" : [
            "\(report.userID)" : [
                "email": "\(report.email)",
                "message": "\(report.message)"]]])
    }
}
