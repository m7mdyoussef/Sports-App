//
//  LeaguesServiceTest.swift
//  Sports AppTests
//
//  Created by Wesam on 4/27/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import XCTest

@testable import Sports_App

class LeaguesServiceTest: XCTestCase {

    //var realLeaguesService:ApiServices!
    var mockLeaguesService:MockLeaguesService!

    override func setUpWithError() throws {
        //realLeaguesService = ApiServices()
        mockLeaguesService = MockLeaguesService(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        //realLeaguesService = nil
        mockLeaguesService = nil
    }

    func testRealLeagues(){
        let expect = expectation(description: "expecting")
        
        
        ApiServices.instance.getResponses(url: URLs.allLeagues.rawValue, id: "Soccer" ) { (data: Leagues?, errorMessage) in
                    
            guard let data = data, errorMessage == nil else{
                print("error")
                XCTFail()
                return
            }
            
            if data.leagues != nil{
                expect.fulfill()
                XCTAssertGreaterThan(data.leagues?.count as! Int, 0)
                
            }
            

          
       }
        waitForExpectations(timeout: 3, handler: nil)
    }

    
    func testMockContactService(){
        mockLeaguesService.getResponses(url: URLs.allLeagues.rawValue, id: "Soccer" ) { (data: Leagues?, errorMessage) in
            
            guard let data = data, errorMessage == nil else{
                print("error")
                XCTFail()
                return
            }
            
            if data.leagues != nil{
                XCTAssertGreaterThan(data.leagues?.count as! Int, 0)
                
            }
        }
    }




}

