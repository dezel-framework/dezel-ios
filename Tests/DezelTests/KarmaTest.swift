import XCTest
@testable import Dezel

class JavaScriptAPITest: XCTestCase {
		
	func testJavaScriptAPI() {
	
		let expectation = XCTestExpectation(description: "Done")
		
		let runner = TestRunner()
		
		runner.start(
			host: "localhost",
			port: "9876"
		)

		runner.complete = {
			expectation.fulfill()
		}
		
		self.wait(for: [expectation], timeout: 60 * 15)
		
		XCTAssertEqual(runner.failureCount, 0, "TOTAL: \(runner.failureCount) FAILED, \(runner.successCount) SUCCESS")
	}
}
