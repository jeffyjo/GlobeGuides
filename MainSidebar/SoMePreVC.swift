//
//  SoMeVC.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 16/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class SoMeVC: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var navTitle: NavBarTitle!

    @IBOutlet weak var facebookLbl: UILabel!
    @IBOutlet weak var instaLbl: UILabel!
    @IBOutlet weak var twitterLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        menuBtn.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuBtn.tintColor = UIColor(hex: 0x036B34)
        
        facebookLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(facebookTapped)))
        facebookLbl.text = "\u{f082}"
        facebookLbl.isUserInteractionEnabled = true
        
        instaLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(instagramTapped)))
        instaLbl.text = "\u{f16d}"
        instaLbl.isUserInteractionEnabled = true
        
        twitterLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(twitterTapped)))
        twitterLbl.text = "\u{f099}"
        twitterLbl.isUserInteractionEnabled = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    func facebookTapped(){
        print("facebook")
        
        let alert = UIAlertController(title: "Facebook", message: "Go to facebook", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Facebook", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            
            //let facebookLink = "https://www.facebook.com"
            //let options = [UIApplicationOpenURLOptionUniversalLinksOnly: true]
            
            //UIApplication.shared.openURL(NSURL(string: facebookLink) as! URL)
//            UIApplication.shared.open(URL(string: facebookLink)!, options: options, completionHandler: nil)
/*
            let facebookLink = "https://www.facebook.com"
                if #available(iOS 10, *){
                    UIApplication.shared.open(URL(string: facebookLink)!, options: [:],completionHandler: { (success) in
                        print("Open \(facebookLink): \(success)")
                    })
                } else {
                    let success = UIApplication.shared.open(URL(string: facebookLink)!)
                    print("Open facebook.com: \(success)")
                }
            */
            
            let fbURLs = [
            "fb://", // App
            "http://www.facebook.com/" // Website if app fails
            ]
            
            let application = UIApplication.shared
            if #available(iOS 10, *){
                for url in fbURLs {
                    if application.canOpenURL(URL(string: url)!) {
                        application.open(URL(string: url)!, options: [:],completionHandler: { (success) in
                            print("Open \(url): \(success)")
                        })
                    }
                }
            } else {
                let success = UIApplication.shared.openURL(NSURL(string: "https:www.facebook.com") as! URL)
                print("Open facebook.com: \(success)")
            }
            return
        } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil ))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func instagramTapped(){
        print("instagram")
    }
    
    func twitterTapped(){
        print("twitter")
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
