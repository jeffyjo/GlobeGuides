//
//  SocialMediaVC.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 04/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class SocialMediaVC: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var facebookIcon: UILabel!
    @IBOutlet weak var instaIcon: UILabel!
    @IBOutlet weak var twitterIcon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Button to sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        menuButton.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuButton.tintColor = UIColor(hex: 0x036B34)
        
        //Gesture Recognizer for SoMe-labels
        let fbTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(SocialMediaVC.fbTapped))
        
        facebookIcon.text = "\u{f082}"
        facebookIcon.addGestureRecognizer(fbTapRecognizer)
        facebookIcon.isUserInteractionEnabled = true
        
        let instaTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(SocialMediaVC.instaTapped))
        
        instaIcon.text = "\u{f16d}"
        instaIcon.addGestureRecognizer(instaTapRecognizer)
        instaIcon.isUserInteractionEnabled = true
        
        let twitterTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(SocialMediaVC.twitterTapped))
        
        twitterIcon.text = "\u{f099}"
        twitterIcon.addGestureRecognizer(twitterTapRecognizer)
        twitterIcon.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    //funcitons to gestureRecognizer on SoMe-Icons
    func fbTapped(){
        
        let alert = UIAlertController(title: "Facebook", message: "Go to facebook", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Facebook", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            
            let facebookLink = "https://www.facebook.com"
            
            UIApplication.shared.openURL(NSURL(string: facebookLink) as! URL)
            
        } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func instaTapped(){
        print("insta")
        
        let alert = UIAlertController(title: "Instagram", message: "Go to Instagram", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Instagram", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            
            let instagramLink = "https://www.instagram.com"
            
            UIApplication.shared.openURL(NSURL(string: instagramLink) as! URL)
            
        } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil ))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func twitterTapped(){
        print("twitter")
        
        let alert = UIAlertController(title: "Twitter", message: "Go to twitter", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            
            let twitterLink = "https://www.instagram.com"
            
            UIApplication.shared.openURL(NSURL(string: twitterLink) as! URL)
            
        } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil ))
        
        self.present(alert, animated: true, completion: nil)
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
