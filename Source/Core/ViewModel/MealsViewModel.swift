import UIKit
import Foundation
import FirebaseDatabase


public class MealsViewModel {
    
    let cellIdentifier = "mealcell"
    var foodList: [MealItems] = []
    var mealID: String?
    var mealType: String?
    var uniqueFetchID: String?
    
    let ref: DatabaseReference = FoodAppClient.databaseRef
    
    public func populateFoodList(completion: @escaping () -> Void) {
        
        let mealsRef = "meals/"
//        let today = Date()
//        let date = today.dateToIsoFormat(date: today)
        let date = "2018-03-09" // temporary date
        
        guard
            let mealType = uniqueFetchID else { return }
        
        let fullref = "\(mealsRef)\(date)/\(mealType)"
        
        ref.child(fullref).observe(.value) { (snapshot) in
            if let mealTypeDict = snapshot.value as? [String: Any],
                let mealID = mealTypeDict["meal_id"] as? String,
                let mealItems = mealTypeDict["meal_items"] as? [String: String] {
                    self.mealID = mealID
                
                    let items = mealItems.compactMap({ (arg: (key: String, value: String)) -> MealItems? in
                        let mealItem = MealItems(id: arg.key, name: arg.value)
                        return mealItem
                    })
                
                    self.foodList = items
                    self.mealType = mealType
                    completion()
            }
        }
    }
}
