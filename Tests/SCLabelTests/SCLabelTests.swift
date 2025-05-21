import XCTest
import SwiftUI
@testable import SCLabel

final class SCLabelViewTests: XCTestCase {
    @MainActor func testViewRendering() {
        let view = SCLabelView(buttonAction: {})
        XCTAssertNotNil(view.body, "The view's body should not be nil.")
    }

    @MainActor func testButtonTap() {
        let expectation = XCTestExpectation(description: "Button action is triggered")
        
        // Mock action for button
        let buttonAction = {
            expectation.fulfill()
        }
        
        // Create view and trigger action
        let view = SCLabelView(buttonAction: buttonAction)
        view.buttonAction()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
