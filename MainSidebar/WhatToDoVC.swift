//
//  WhatToDoVC.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 10/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class WhatToDoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var whatToDoTitle: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let sightsList: [String] = ["Eiffel Tower", "Siennen"]
    let artList: [String] = ["Louvre", "Paris Museum"]
    let shoppingList: [String] = ["Avenue des Champs-Élysées", "Disney Shop"]
    let foodAndDrinkList: [String] = ["Baguette", "Cheese"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Buttons to sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        let segmentTxt = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        whatToDoTitle.text = segmentTxt?.uppercased()
        
        menuButton.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuButton.tintColor = UIColor(hex: 0x036B34)
        
        segmentControl.addTarget(self, action: #selector(segmentTapped), for: .touchUpInside)
        
        segmentControl.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func segmentPressed(segment: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex {
        case 0:
            //tableView.setdata "Sights"
            break
        case 1:
            //tableView.setdata "Arts"
            break
        case 2:
            //tableView.setdata "Shopping"
            break
        case 3:
            //tableView.setdata "drinks&food"
            break
        default:
            let alert = UIAlertController(title: "WRONG", message: "can't show that", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in})
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            break
        }
        
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch(segmentControl.selectedSegmentIndex)
        {
        case 0:
            returnValue = sightsList.count
            break
        case 1:
            returnValue = artList.count
            break
            
        case 2:
            returnValue = shoppingList.count
            break
        case 3:
            returnValue = foodAndDrinkList.count
            
        default:
            break
            
        }
        
        return returnValue
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "WhatToDoCell", for: indexPath) as? WhatToDoCell
        
        switch(segmentControl.selectedSegmentIndex)
        {
        case 0:
            myCell?.whatLbl.text = sightsList[indexPath.row]
            break
        case 1:
            myCell?.whatLbl.text = artList[indexPath.row]
            break
            
        case 2:
            myCell?.whatLbl.text = shoppingList[indexPath.row]
            break
        case 3:
            myCell?.whatLbl.text = foodAndDrinkList[indexPath.row]
        default:
            break
            
        }
        
        myCell?.styling()
        return myCell!
    }
    
    func segmentTapped(sender: AnyObject) {
        let segmentTxt = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        whatToDoTitle.text = segmentTxt?.uppercased()
        tableView.reloadData()
    }
}
