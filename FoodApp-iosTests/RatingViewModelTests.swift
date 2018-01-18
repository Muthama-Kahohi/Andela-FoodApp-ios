import XCTest
import Firebase

@testable import FoodApp_ios

class RatingViewModelTests: XCTestCase {

    private let vm = RatingViewModel()

    func test_get_current_date() {

        let date = vm.getCurrentDate()
        XCTAssertNotNil(date)
        XCTAssert(type(of: date) == type(of: "Date"))
    }

    func test_load_samples() {

        vm.loadSampleMeal()
         let sampleFood = MealItem(name: "Ugali", rating: 4)
        XCTAssertEqual(vm.foodList.count, 5)
        XCTAssert(type(of: sampleFood) == type(of: vm.foodList[0]))

    }
}

