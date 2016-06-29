//
//  JsonReader.swift
//  ok fine
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import Foundation

class JsonReader {
    class func readJson(fileName: String) -> Dictionary<String, AnyObject> {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")!
        let jsonData = NSData(contentsOfMappedFile: path)
        
        let dict = try? NSJSONSerialization.JSONObjectWithData(jsonData!, options: .AllowFragments)

        print(dict);
        return dict as! Dictionary<String, AnyObject>
    }
}


