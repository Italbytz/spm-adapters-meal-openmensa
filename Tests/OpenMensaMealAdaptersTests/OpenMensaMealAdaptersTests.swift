import XCTest
import MealPorts

@testable import OpenMensaMealAdapters

final class OpenMensaMealAdaptersTests: XCTestCase {
    func testCommand() async throws {
        let command = GetOpenMensaMealsCommand()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime = formatter.date(from: "2022/01/11")!
        let meals = try await command.execute(inDTO: TestMealQuery(mensa: 42, date: someDateTime))
        XCTAssert(meals.count > 0)
    }
}

struct TestMealQuery : MealQuery {
    var mensa: Int
    var date: Date
}
