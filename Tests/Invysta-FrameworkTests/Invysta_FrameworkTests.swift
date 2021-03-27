import XCTest
@testable import Invysta_Framework

final class Invysta_FrameworkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Invysta_Framework().text, "Hello, World!")
        
        let auth = AuthenticationObject(uid: "", nonce: "", caid: "", provider: "", identifier: [""])
        
        NetworkManager().call(auth) { (_, _, _) in
            
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
