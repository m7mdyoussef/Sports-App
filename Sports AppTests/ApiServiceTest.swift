//
//  ApiServiceTest.swift
//  Sports AppTests
//
//  Created by mohamed youssef on 4/26/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import XCTest
@testable import Sports_App

class ApiServiceTest: XCTestCase {

    
    var homeViewController : HomeViewController?
    var expectation = XCTestExpectation(description: "wait for response")
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(identifier: "HomeViewController")
        homeViewController?.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
         homeViewController = nil
         try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func testActualService(){
        ApiServices.instance.getResponses(url: URLs.allSports.rawValue) { (data: Sport?, error) in

            XCTAssertNotNil(data)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
    }
    
    func testMockService() {
        let mockService = MockApiServices()
        mockService.getResponses(url: "", id: "") { (data: Sport?, error) in
        XCTAssertNotNil(data)
          
        }
       
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
