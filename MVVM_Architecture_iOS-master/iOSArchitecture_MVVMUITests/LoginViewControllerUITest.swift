//
//  LoginViewControllerUITest.swift
//  iOSArchitecture_MVVMUITests
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import XCTest
@testable import iOSArchitecture_MVVM

class LoginViewControllerUITest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
    }
    
    func testLoginButtonEnabled() {
        
        let app = XCUIApplication()
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("tarun@gmail.com")
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        app.secureTextFields["Password"].typeText("123456")
        XCTAssert(app.buttons["Login"].isEnabled, "Login Button is enabled")
        
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("tarun@gmail")
        passwordSecureTextField.tap()
        app.secureTextFields["Password"].typeText("123456")
        XCTAssert(!app.buttons["Login"].isEnabled, "Login Button is disabled")
    }
}
