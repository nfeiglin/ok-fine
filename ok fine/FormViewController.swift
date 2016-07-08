//
//  FormViewController.swift
//  ok fine
//
//  Created by Nathan Feiglin on 8/07/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import UIKit

enum FormItemTypes {
    case Textfield
    case NumberInput
    case Datepicker
    case Select
}

struct FormItem {
    var itemType:FormItemTypes
    var helpText: String?
    var formItemIdentifier: String?
    
    var value: AnyObject?
    
    init(itemType:FormItemTypes, identifier: String, helpText:String? = nil) {
        self.itemType = itemType
        self.formItemIdentifier = identifier
        
        if let helperText = helpText {
            self.helpText = helperText
        }
        
    }
    
    mutating func setValue(theValue:AnyObject) {
        value = theValue
    }
    
}

class FormViewController: UIViewController {

    var formUid:String?
    var formItems:Dictionary<String, Array<FormItem>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("==== Form View Appeared ===")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
