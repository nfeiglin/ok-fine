//
//  ok_fineTests.swift
//  ok fineTests
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import XCTest

@testable import ok_fine

class Ok_fineTests: XCTestCase {
    var dataDict : Dictionary<String, AnyObject>?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //dataDict = JsonReader.readJson("data.json")
        print(dataDict)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTestActuallyIsCalled() {
        print("==== YOYOYOYOYOY ==== ")
        XCTAssertEqual(30, 30, "30 equals 30")
    }
    
    func testTemplaterOne() {
        let templateText : String  = dataDict!["templates"]!["nsw.bay.signs.contradictory"]
        let templater = Templater(templateText: templateText, renderDelimiterStart: "{{ ", renderDelimiterEnd: " }}")

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
 */
    
}
