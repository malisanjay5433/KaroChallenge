//
//  KaroooooCodeChallengeTests.swift
//  KaroooooCodeChallengeTests
//
//  Created by Sanjay on 15/12/22.
//

import XCTest
@testable import KaroooooCodeChallenge

final class KaroooooCodeChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testusername_with_EMPTY_INPUT(){
        print("testusername_with_EMPTY_INPUT")
        let val = Validation()
        let result = val.isValidUsername(username: "")
        XCTAssertEqual(false, result)
    }
    func testusername_with_RANDOM_INPUT(){
        print("testusername_with_RANDOM_INPUT")
        let val = Validation()
        let result = val.isValidUsername(username: "  ")
        print(result)
        XCTAssertEqual(false, result)
    }
    func testusername_with_VALID_INPUT(){
        print("testusername_with_VALID_INPUT")
        let val = Validation()
        let result = val.isValidUsername(username: "sanjay")
        print(result)
        XCTAssertEqual(true, result)
    }
    
    func testPassword_with_EMPTY_INPUT(){
        print("testPassword_with_EMPTY_INPUT")
        let val = Validation()
        let result = val.isValidatePassword(password:"")
        XCTAssertEqual(false, result)
    }
    func testPassword_with_RANDOM_INPUT(){
        print("testPassword_with_RANDOM_INPUT")
        let val = Validation()
        let result = val.isValidatePassword(password:" ")
        print(result)
        XCTAssertEqual(false, result)
    }
    func testPassword_with_VALID_INPUT(){
        print("testPassword_with_VALID_INPUT")
        let val = Validation()
        let result = val.isValidatePassword(password:"Sanjay212")
        print(result)
        XCTAssertEqual(true, result)
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
