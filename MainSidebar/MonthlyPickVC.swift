//
//  ViewController.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 04/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class MonthlyPickVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var image: UIImage!
    
    @IBOutlet weak var monthlyTitle: UILabel!
    
    @IBOutlet weak var monthlyDesciption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = image

        // Do any additional setup after loading the view.
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

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
