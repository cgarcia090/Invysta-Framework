import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Invysta_FrameworkTests.allTests),
    ]
}
#endif
