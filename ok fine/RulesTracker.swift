//
//  RulesTracker.swift
//  ok fine
//
//  Created by Nathan Feiglin on 6/07/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import Foundation

protocol TrackerProtocol {
    func pushEvent(event: TrackerType)
    func popEvent()
    
    func getEvent(eventIndex:Int) ->TrackerType
}

struct RulesTracker {
    
    class Tracker:TrackerProtocol {
        
        let debug = true
        
        static let sharedTracker = Tracker()
        static var triggeredEvents:[TrackerType] = []
        
        
        func pushEvent(event: TrackerType) {
            Tracker.triggeredEvents.append(event)
            
            if self.debug {
                debugPrint(event)
            }
        }
        
        func fireEvent(event: TrackerType) {
            pushEvent(event)
        }
        
        func popEvent() {
            Tracker.triggeredEvents.popLast()
        }
        func listEvents() -> [TrackerType] {
            return Tracker.triggeredEvents
        }
        
        func getEvent(eventIndex:Int) -> TrackerType {
            return Tracker.triggeredEvents[eventIndex]
        }

    }
    

}

protocol TrackerType {
    init(eventName: String, date: NSDate, payload:Dictionary<String, AnyObject>)
    
    func getEventName() -> String
    func getEventDate() -> NSDate
    func getEventPayload() -> Dictionary<String, AnyObject>
    
}

struct RulesTrackerType:TrackerType {
    let eventName: String
    let triggeredDate: NSDate
    let eventPayload: Dictionary<String, AnyObject>
    
    init(eventName: String, date: NSDate, payload:Dictionary<String, AnyObject>) {
        self.eventName = eventName
        self.triggeredDate = date
        self.eventPayload = payload
    }
    
    func getEventName() -> String {
        return self.eventName
    }
    
    func getEventDate() -> NSDate {
        return self.triggeredDate
    }
    
    func getEventPayload() -> Dictionary<String, AnyObject> {
        return self.eventPayload
    }
    
}


class TrackerHelper {
    
    class func trackMenuEvent(selectedObject:Dictionary<String, AnyObject>, callingInstance: AnyObject? = nil) {
        
        var eventName = "event.no.name"
        
        if (selectedObject.indexForKey("meta") != nil) {
            let meta = selectedObject["meta"]!
            if (meta.objectForKey("option_uid") != nil) {
                eventName = meta["option_uid"]! as! String
            }
        }
        
        let instance = callingInstance ?? self
        
        let trackerPayload:Dictionary<String, AnyObject> = [
            "origin": "function: \(#function), line: \(#line) -- of \(String(instance))",
            "object": selectedObject
        ]
        
        RulesTracker.Tracker.sharedTracker.pushEvent(RulesTrackerType(eventName: eventName, date: NSDate(), payload: trackerPayload))
        
    }
    
}
