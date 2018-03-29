
import Foundation
import FirebaseDatabase


class MealsViewModel {

    let cellIdentifier = "mealcell"
    var foodList = [MealItem]()
    var mealnumbers = [String]()
    var ref: DatabaseReference?
    var refHandle: UInt = 0
    var reflist = [DatabaseReference]()


    public func displayCurrentDate() -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter.string(from: now)
    }

    public func loadSampleMeal(completion: @escaping ([Int]) -> Void){

        // Gets the ref of the meal items of a specific day

        ref = Database.database().reference()

        let mealsRef = "meals/1/meal_items"
        var list = [Int]()
        ref?.child(mealsRef).observe(.value, with: { snapshot in

            if snapshot.childrenCount > 0 {

                let enumerator = snapshot.children
                while let next = enumerator.nextObject() as? DataSnapshot, let id = next.value as? Int {

                    list.append(id)
                }
            }
            completion(list)
        })

    }

    public func populateFoodList(mealIds: [Int], completion: @escaping () -> Void) {
        let mealItemsRef = "mealItems/"

        for id in mealIds {

            let fullref = "\(mealItemsRef)\(id)"
            ref?.child(fullref).observe(.value, with: { snapshot in

                if let snapDict =  snapshot.value as? [String: Any],
                    let name = snapDict["name"] as? String {

                    let mealItem = MealItem(name: name)

                    self.foodList.append(mealItem)
                    completion()
                }
            })
        }
        //completion()
    }
}
