//
//  ok_fineTests.swift
//  ok fineTests
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import XCTest
import Foundation


@testable import ok_fine

class Ok_fineTests: XCTestCase {
    var dataDict : NSDictionary = [:]

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataDict = JsonReader.readJson("data")
        debugPrint(dataDict)
        print("IN SETUP METHOD")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTestActuallyIsCalled() {
        debugPrint("==== YOYOYOYOYOY ==== ")
        XCTAssertEqual(30, 30, "30 equals 30")
    }
    
    func testTemplateRenderingWithOneVariable() {

        let templatesDict = dataDict["templates"] as! Dictionary<String, String>

        let templateText = templatesDict["nsw.test.one"]!
        let templater = Templater(templateText: templateText, renderDelimiterStart: "{{ ", renderDelimiterEnd: " }}")
        
        let renderVariables : Dictionary <String, String> = [
            "name": "Nathan Feiglin"
        ]
        
        let renderedText = templater.render(renderVariables)
        
        XCTAssertEqual(renderedText, "My name is Nathan Feiglin.");

    }
    
    
    func testTemplateRenderingWithTwoVariables() {
        let templatesDict = dataDict["templates"] as! Dictionary<String, String>
        
        let templateText = templatesDict["nsw.test.two"]!
        let templater = Templater(templateText: templateText, renderDelimiterStart: "{{ ", renderDelimiterEnd: " }}")
        
        let renderVariables : Dictionary <String, String> = [
            "name": "Nathan Feiglin",
            "infring.date": "30 June 2016"
        ]
        
        let renderedText = templater.render(renderVariables)
        
        XCTAssertEqual(renderedText, "My name is Nathan Feiglin. This was tested on 30 June 2016...");
        
    }
    
    func testRenderingTwoVariablesNextToEachOther() {
        let templatesDict = dataDict["templates"] as! Dictionary<String, String>
        
        let templateText = templatesDict["nsw.test.vars-next-to-each-other"]!
        let templater = Templater(templateText: templateText, renderDelimiterStart: "{{ ", renderDelimiterEnd: " }}")
        
        let renderVariables : Dictionary <String, String> = [
            "name": "Nathan Feiglin",
            "title": "Mr"
        ]
        
        let renderedText = templater.render(renderVariables)
        
        XCTAssertEqual(renderedText, "My name is MrNathan Feiglin");
    }
    
    func testRulesTracker() {
        let tracker = RulesTracker.Tracker.sharedTracker
        
        let dict:Dictionary<String, AnyObject> = Dictionary()
        
        let event1:RulesTrackerType = RulesTrackerType(eventName: "test.test.one", date: NSDate(timeIntervalSinceNow: 0), payload: Dictionary())
        let event2:RulesTrackerType = RulesTrackerType(eventName: "test.test.two", date: NSDate(timeIntervalSinceNow: 400), payload: Dictionary())
        
        tracker.pushEvent(event1)
        tracker.pushEvent(event2)
        
        XCTAssertEqual(tracker.getEvent(0).getEventName(), "test.test.one")
        XCTAssertEqual(tracker.getEvent(1).getEventName(), "test.test.two")
    }

    func testFormHelperItemiseFunction(){
        dataDict = JsonReader.readJson("data")
        
        let triggeredEventTestName = "nsw.bay.signs.contradictory"
        
        let attributeDescriptions:Dictionary<String, Dictionary<String,String>> = dataDict["input-descriptions"]! as! Dictionary<String, Dictionary<String, String>>
        
        //let allInputAttributes:Dictionary<String, Dictionary<String, String>> = dataDict["input-attributes"]! as! Dictionary<String, Dictionary<String, String>>
        
        
        let allRequiredInputs: Dictionary<String, Array<String>> = dataDict["required-input"]! as! Dictionary<String, Array<String>>
        
        let requiredInputs:[String] = allRequiredInputs[triggeredEventTestName]!
    
        let itemised = FormHelper.itemise(attributeDescriptions, requiredInput: requiredInputs)
        debugPrint(itemised)
        
        XCTAssertEqual(itemised.first?.formItemIdentifier, "name")
    }
    
    /*
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
 */
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
 */
    
}
