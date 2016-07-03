//
//  MenuViewController.swift
//  ok fine
//
//  Created by Nathan Feiglin on 4/07/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var passedData:Array<Dictionary<String, AnyObject>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let menuTableViewController:TableViewBuilder = TableViewBuilder()
        menuTableViewController.tableViewData = self.passedData as Array<Dictionary<String, AnyObject>>?
        
        let navController:UINavigationController = UINavigationController(rootViewController: menuTableViewController)
        
        
        self.presentViewController(navController, animated: false) {
            print("Nav controller presented")
            //navController.pushViewController(menuTableViewController, animated: false)
        }
        
        
        
        
    }
    
    
/*
   required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
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
