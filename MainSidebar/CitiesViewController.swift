//
//  OutViewController.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 07/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class CitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        menuBtn.setFAIcon(icon: FAType.FABars, iconSize: 30.00)
        menuBtn.tintColor = UIColor(hex: 0x036B34)
            //self.navigationItem.title = "globe guides"
        
        /*
            if let navigationBar = self.navigationController?.navigationBar {
            //t?.addSubview(title)
            //self.navigationItem.title = "globe guides"
            
                let globe = CGRect(x: self.view.frame.width/2/1.5, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
                
                let guides = CGRect(x: self.view.frame.width/2, y: 8, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
                
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
 */
        
            
            //creating City-objects to Array
            let c1 = City()
            c1.cityName = "Paris"
            c1.cityImg = #imageLiteral(resourceName: "Paris")
            cities.append(c1)
            
            let c2 = City()
            c2.cityName = "Amsterdam"
            c2.cityImg = #imageLiteral(resourceName: "Amsterdam")
            cities.append(c2)
            
            let c3 = City(cityname: "London", img: #imageLiteral(resourceName: "London"))
            cities.append(c3)
            
            let c4 = City(cityname: "Berlin", img: #imageLiteral(resourceName: "Berlin"))
            cities.append(c4)
            
            tableView.delegate = self
            tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CitiesTableCell {
        
            let city = cities[indexPath.row]
        
            cell.updateUI(city: city)
            
            return cell
        
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0, 0] {
            //self.performSegue(withIdentifier: "MainVC", sender: self)
            let storyboard = UIStoryboard(name: "MainApp", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
            
            self.present(controller, animated: true, completion: nil)
        }
        
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
