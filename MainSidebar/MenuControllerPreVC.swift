//
//  ViewController.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 07/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class MenuControllerPreVC: UITableViewController {
    
    var menuItems = [MenuItemPreCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    


}

