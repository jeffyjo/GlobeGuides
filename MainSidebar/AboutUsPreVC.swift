//
//  Out2ViewController.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 07/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class Out2ViewController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        menuBtn.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuBtn.tintColor = UIColor(hex: 0x036B34)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
