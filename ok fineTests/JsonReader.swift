//
//  JsonReader.swift
//  ok fine
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import Foundation

class JsonReader {
    class func readJson(fileName: String) -> NSDictionary {
        print("== Got to first line of readJson")
        
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        debugPrint(path)
        
        let url = NSURL.fileURLWithPath(path!, isDirectory: false)
        
        
        let jsonData = NSData.init(contentsOfURL: url)!
        
        debugPrint(jsonData)
        
        let dict =  try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)

        print(dict as! NSDictionary);
        let dicDic = dict as! NSDictionary
        
        print(dicDic["options"]!["nsw"])
        
        return dict as! NSDictionary
    }
}


