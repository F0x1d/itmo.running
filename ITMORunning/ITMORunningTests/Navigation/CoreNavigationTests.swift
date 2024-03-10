import XCTest
@testable import CoreNavigation

final class CoreNavigationTests: XCTestCase {
    
    func testShouldOpenFirstScreen() {
        let navigator = TestNavigator()
        
        navigator.openFirstScreen()
        
        XCTAssertFalse(navigator.path.isEmpty, "path must not be empty")
    }
    
    func testShouldOpenAndCloseScreens() {
        let navigator = TestNavigator()
        
        navigator.openFirstScreen()
        navigator.openSecondScreen()
        
        navigator.popBackStack()
        navigator.popBackStack()
        
        XCTAssertTrue(navigator.path.isEmpty, "path must be empty")
    }
}
