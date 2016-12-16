//
//  TravelGuidesVC.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 06/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class TravelGuidesVC: UIViewController, UITabBarDelegate {

    @IBOutlet weak var travelLbl: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Buttons to sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        menuButton.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuButton.tintColor = UIColor(hex: 0x036B34)
        
        segmentControl.addTarget(self, action: #selector(segmentPressed), for: .touchUpInside)
        
        segmentControl.addTarget(self, action: #selector(segmentPressed), for: .valueChanged)
        
        travelLbl.text = "24 Hours"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segmentPressed(segment: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex {
        case 0:
            travelLbl.text = "24 Hours"
            break
        case 1:
            travelLbl.text = "48 Hours"
            break
        case 2:
            travelLbl.text = "72 Hours"
            break
        case 3:
            travelLbl.text = "4 Days"
            break
        case 4:
            travelLbl.text = "5 Days"
            break
        case 5:
            travelLbl.text = "6 Days"
            break
        /*case 6:
            travelLbl.text = "7 Days"
            break*/
        default:
            let alert = UIAlertController(title: "WRONG", message: "can't show that", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in})
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            break
        }
        
    }
}
