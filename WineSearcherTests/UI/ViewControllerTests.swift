import XCTest
@testable import WineSearcher

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        viewController = ViewController()
    }

    override func tearDown() {
        viewController = nil
    }

    func testExample() {
        XCTAssertNotNil(viewController)
    }

}
