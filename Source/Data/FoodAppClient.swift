import Firebase
import FirebaseAuth
import FirebaseDatabase

public class FoodAppClient {
    
    //Private Instance Methods
    
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    private var currentUser: User? {
        return appDelegate?.currentUser
    }
    
    private var currentUserID: String? {
        return appDelegate?.currentUserId
    }
    
    // Database Instance
    static let databaseRef = Database.database().reference()
    
    //MARK: Public Instance Methods
    
    public func getChildrenCount(completion: @escaping (UInt) -> Void) {
        
        FoodAppClient.databaseRef.child("ratings").observeSingleEvent(of: .value, with: { (snapshot) in
            
            completion(snapshot.childrenCount)
        })
    }
    
    public func submitComment(_ comment: Comments) {
        
        getChildrenCount { (childrenCount) in
            let count = childrenCount + 1
            FoodAppClient.databaseRef.child("comments/\(count)").setValue(["\(comment.date)": [
                "\(comment.mealID)" : [
                    "\(comment.userID)" : [
                        "comment": "\(comment.comment)",
                        "email": "\(comment.email)"
                    ]]]])
        }
    }
    
    public func submitRatings(_ ratings: Ratings) {
        
        getChildrenCount { (childrenCount) in
            let count = childrenCount + 1
            FoodAppClient.databaseRef.child("ratings/\(count)").setValue(["\(ratings.date)": [
                "\(ratings.mealID)": [
                    "\(ratings.userID)": [
                        "email": "\(ratings.email)",
                        "rating": ratings.rating]
                ]]])
        }
    }
}
