//
//  TableViewBuilder.swift
//  ok fine
//
//  Created by Nathan Feiglin on 3/07/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import UIKit

class TableViewBuilder: UITableViewController {

    var tableViewData:Array<Dictionary<String, AnyObject>>?
    var hasChildren:Bool = false
    var firstObject:Dictionary<String, AnyObject>?
    
    var childrenObjects:Array<Dictionary<String, AnyObject>>?
    
    func setTableViewCellsData(data: Array<Dictionary<String, AnyObject>>) {
        self.tableViewData? = data
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerClass(MenuTableViewCell.self, forCellReuseIdentifier: "menuCell")
        self.firstObject = tableViewData![0] as Dictionary<String, AnyObject>!
        
        //let metaOfFirst:Dictionary<String, AnyObject> = self.firstObject!["meta"]! as! Dictionary<String, AnyObject>
        
        self.hasChildren = self.firstObject!["has_children"] as! Bool
        
        if(hasChildren) {
            self.childrenObjects = self.firstObject!["children"] as? Array<Dictionary<String, AnyObject>>
            self.title = self.firstObject!["title"] as! String /* TODO: Handle for no title case */
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var theCount = tableViewData!.count
        
        if (self.hasChildren) {
            print("HAS CHILDREN, SO RETURN COUNT OF CHILDREN")
            theCount = self.firstObject!["children"]!.count!
            print("The count is \(theCount)")
            
        }
        
        
        return theCount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:MenuTableViewCell! = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuTableViewCell

        if (cell == nil) {
            cell = MenuTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"menuCell")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        
        if (hasChildren) {
            cell.textLabel?.text = childrenObjects![indexPath.row]["title"] as? String

        }
        
        else {
            cell.textLabel?.text = tableViewData![indexPath.row]["title"] as? String

        }
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}