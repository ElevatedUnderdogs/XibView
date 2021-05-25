    import XCTest
    @testable import XibView

    class Demo: NibView {

        var text: String = ""
    }

    final class XibViewTests: XCTestCase {
        func testExample() {

            // An error may indicate that you haven't hooked up your custom view....
            let n = Demo(frame: CGRect(x: 1, y: 1, width: 10, height: 20))
            XCTAssert(n.text == "")
            // let new
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            //  XCTAssertEqual(XibView().text, "Hello, World!")
        }
    }
