//
//  NavBarTitle.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 17/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class NavBarTitle: UINavigationItem {
    private var _UIViewC: UIViewController!
    
    var UIViewC: UIViewController {
        get {
            return _UIViewC
        } set {
            _UIViewC = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
    
    if let navigationBar = _UIViewC.navigationController?.navigationBar {
        
        let globe = CGRect(x: _UIViewC.view.frame.width/2/1.5, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
        
        let guides = CGRect(x: _UIViewC.view.frame.width/2, y: 8, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
        
        let globeTXT = UILabel(frame: globe)
        globeTXT.text = "globe"
        globeTXT.textColor = UIColor(red: 0.3, green: 1.07, blue: 0.52, alpha: 0.8)
        globeTXT.font = globeTXT.font.withSize(25)
        
        let guidesTXT = UILabel(frame: guides)
        guidesTXT.text = "guides"
        guidesTXT.textColor = UIColor(colorLiteralRed: 0.03, green: 1.07, blue: 0.52 , alpha: 0.8)
        guidesTXT.font = globeTXT.font.withSize(25)
        
        
        navigationBar.addSubview(globeTXT)
        navigationBar.addSubview(guidesTXT)
        }
    }
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
