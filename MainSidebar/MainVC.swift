//
//  ViewController.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 20/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class MainVC: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var extraButton: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var guru1View: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var socialLbl: UILabel!
    
    var images = [UIImageView]()
    var swipeValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Buttons to sidebar
        if self.revealViewController() != nil {
            //TO-DO: menucontroller = view.frame/3
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            //Font Awesome BarBtn
            menuButton.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
            menuButton.tintColor = UIColor(hex: 0x036B34)
            //extraButton.setFAIcon(icon: FAType.FA, iconSize: 30.00)
            //extraButton.tintColor = UIColor(hex: 0x036B34)
            
         
            revealViewController().rightViewRevealWidth = self.view.frame.width / 2
            extraButton.target = revealViewController()
            extraButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        //Timer for scrollView
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(moveToPage), userInfo: nil, repeats: true)
        
        //scrollView.layer.borderWidth = 1
        scrollView.layer.masksToBounds = true
        //scrollView.layer.borderColor = UIColor.darkGray.cgColor
        scrollView.layer.shadowColor = UIColor.darkGray.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 10, height: 10)
        scrollView.layer.shadowRadius = 5
        scrollView.layer.shadowOpacity = 0.5
        
        //gesturerecognizer to scrollView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imgTapped(img:)))
        scrollView.isUserInteractionEnabled = true
        scrollView.addGestureRecognizer(tapGestureRecognizer)
   
        nameLbl.text = "Cecilie Skree"
        ageLbl.text = "Age: 24"
        occupationLbl.text = "Occupation: Full time \n" +
            "worker at the Union"
        occupationLbl.sizeToFit()
        socialLbl.text = "Social: @cecilieskree"
        
        /*
        //multiline guru label
        descriptionLbl.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"
        descriptionLbl.numberOfLines = 0
        descriptionLbl.sizeToFit()
        descriptionLbl.preferredMaxLayoutWidth = view.frame.size.width / 2
 */
        
        //Styling globeGuru
        //guru1View.layer.masksToBounds = true
        guru1View.layer.shadowColor = UIColor.darkGray.cgColor
        guru1View.layer.shadowOffset = CGSize(width: 10, height: 10)
        guru1View.layer.shadowRadius = 5
        guru1View.layer.shadowOpacity = 0.5
        
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(MainVC.swipeHandler))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MainVC.swipeHandler))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        view.isUserInteractionEnabled = true
        
        for x in 0...2{
            let image = UIImage(named: "IMG\(x+1).png")
            let imageView = UIImageView(image: image)
            
            //Image Styling
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 8.0
            
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat (x)
            
            contentWidth += scrollView.frame.width
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 187.5, y: (scrollView.frame.size.height / 2) - 172.5, width: 375, height: 200)
            
        }
        
        scrollView.clipsToBounds = true
        
        scrollView.contentSize = CGSize(width: contentWidth, height: 1.0)
        //scrollView.isScrollEnabled = false
        
    }

    func swipeHandler(sender: UISwipeGestureRecognizer){
        //left swipe
        if sender.direction.rawValue == 2 {
            moveToNextPage(page: 2)
            
        }//right swipe
        else if sender.direction.rawValue == 1 {
            moveToNextPage(page: 1)
        }
        
    }
    
    
    func moveToNextPage(page: Int){
        let pageWidth: CGFloat = scrollView.frame.width
        let contentOffset: CGFloat = scrollView.contentOffset.x
        
        var slideToX: CGFloat = 0.0
        
        
        if page == 1{
            slideToX = contentOffset - pageWidth
        }
        
        if page == 2{
            slideToX = contentOffset + pageWidth
        }
        
        
        scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:scrollView.frame.height), animated: true)
    }
    
    func moveToPage (){
        
        let pageWidth:CGFloat = self.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * CGFloat (images.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth {
            slideToX = 0
        }
        
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MonthlyPickVC" {
            let dsv = segue.destination as! MonthlyPickVC
            let page = (scrollView.contentOffset.x) / (scrollView.frame.size.width)
            dsv.image = UIImage(named: "IMG\(Int(page+1))")
            
        }
    }

    func imgTapped(img: AnyObject){
        performSegue(withIdentifier: "MonthlyPickVC", sender: self)
    }
}

