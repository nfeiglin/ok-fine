//
//  Templater.swift
//  ok fine
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import Foundation

class Templater {
    private var templateText : String
    let renderCharStart : String
    let renderCharEnd : String
    
    init(templateText: String, renderDelimiterStart: String, renderDelimiterEnd: String) {
        self.templateText = templateText
        self.renderCharStart = renderDelimiterStart
        self.renderCharEnd = renderDelimiterEnd
        
    }
    
    func render(renderVariables: Dictionary<String, AnyObject>) -> String {
        var template = templateText
        
        for (variableName, variableValue) in renderVariables {
            let searchString = self.renderCharStart + variableName + self.renderCharEnd
            
            template = template.stringByReplacingOccurrencesOfString(searchString, withString: variableValue as! String)
        }
        
        return template
    }
    
    func setTemplateText(templateText: String) -> Templater {
        self.templateText = templateText
        return self
    }
}