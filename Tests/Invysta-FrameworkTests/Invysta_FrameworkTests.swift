import XCTest
@testable import Invysta_Framework

final class Invysta_FrameworkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Invysta_Framework().text, "Hello, World!")
        
        let auth = AuthenticationObject(uid: "", nonce: "", caid: "", provider: "", identifier: [""])
        
        Authenticate(auth).start { (results) in
            switch results {
            case .success(let statusCode):
                print(statusCode)
            case .failure(let error, let statusCode):
                print(error, statusCode)
            }
        }
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
