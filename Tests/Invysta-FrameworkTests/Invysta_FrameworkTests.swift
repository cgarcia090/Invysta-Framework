import XCTest
@testable import Invysta_Framework

final class Invysta_FrameworkTests: XCTestCase {
    
    struct MockSource: IdentifierSource {
        var type: String
        
        init(type: String) {
            self.type = type
        }
        
        func identifier() -> String? {
            return type
        }
    }
    
    func testExample() {
        let mocksTypes = ["Mock1", "Mock2", "Mock3", "Mock4"]
        
        let mocks = mocksTypes.map { (id) -> MockSource in
            MockSource(type: id)
        }
        
        IdentifierManager.configure(mocks)
        
        for (i, id) in mocks.enumerated() {
            XCTAssertEqual(IdentifierManager.shared.compiledSources[i], id.type)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
