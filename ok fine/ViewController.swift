//
//  ViewController.swift
//  ok fine
//
//  Created by Nathan Feiglin on 30/06/2016.
//  Copyright © 2016 Nathan Feiglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let menuVC = MenuViewController()
        
        let dataToPass:Array<Dictionary<String, AnyObject>> = JsonReader.readJson("data")["menu"] as! Array<Dictionary<String, AnyObject>>
        menuVC.passedData = dataToPass
        //menuVC.tableViewData = dataToPass
        
        self.presentViewController(menuVC, animated: true) {
            //Completion block
            print("menuVC presented by initial ViewController")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

