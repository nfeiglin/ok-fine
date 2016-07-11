//
//  FormViewController.swift
//  ok fine
//
//  Created by Nathan Feiglin on 8/07/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import UIKit

typealias FormFieldsDescriptionType = Dictionary<String, Dictionary<String, AnyObject>>

enum FormItemTypes {
    case Textfield
    case NumberInput
    case Datepicker
    case Select
}

enum FormItemTypeError:ErrorType {
    case FormItemTypeDoesNotExist
    //case GenericError
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

class FormHelper {
    class func itemise(attributeDescriptions: FormFieldsDescriptionType, requiredInput: [String]) -> [FormItem]{
        
        var formItems:[FormItem] = Array()
        
        for requiredInputName in requiredInput {
            
            do {
                
                var itemType:FormItemTypes
                
                switch attributeDescriptions[requiredInputName]!["type"]! as! String {
                case "text":
                    itemType = FormItemTypes.Textfield
                case "number":
                    itemType = FormItemTypes.NumberInput
                case "date":
                    itemType = FormItemTypes.Datepicker
                case "select":
                    itemType = FormItemTypes.Select
                default:
                    throw FormItemTypeError.FormItemTypeDoesNotExist
                    
                }
                
                let tempFormItem:FormItem = FormItem(itemType: itemType, identifier: requiredInputName, helpText: attributeDescriptions[requiredInputName]!["help-text"] as? String)
                
                formItems.append(tempFormItem)
            }
            catch (FormItemTypeError.FormItemTypeDoesNotExist) {
                print("Form item type does not exists")
            }
            
            catch {
                print("Something's gone wrong: \(self)")
            }

        }
        
        return formItems
    }
    
}


class FormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var formUid:String?
    
    var tableView:UITableView!
    
    //var formItems:Dictionary<String, Array<FormItem>>?
    
    var fields:[FormItem]?
    var fieldDescriptions:FormFieldsDescriptionType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        // Do any additional setup after loading the view.
        
        self.title = "Fill in the form..."
        
    }
    
    func setDescriptions(fieldDescriptions: FormFieldsDescriptionType){
        self.fieldDescriptions = fieldDescriptions
    }
    
    func setFormFields(fields: [FormItem]!) {
        self.fields = fields
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("==== Form View Appeared ===")
        //self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fields!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) ?? UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = self.fields?[indexPath.row].formItemIdentifier ?? "No form identifier"
        
        return cell
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
