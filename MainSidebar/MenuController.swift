//
//  MenuController.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 20/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuItems = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set delegate and datasource to tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        menuItems = [
            Section(name: "City", items: [""]),
            Section(name: "What to do", items: ["Sights", "Art", "Shopping", "Food&Drinks"]),
            Section(name: "Travel Guides", items: ["24 Hours", "48 Hours", "72 Hours", "4 Days", "5 Days", "6 Days", "7 Days"]),
            Section(name: "Hook me up", items: ["Entertain me!", "Feed Me!"]),
            Section(name: "Favourites", items: ["Sights", "Art", "Shopping", "Food&Drinks", "Events"]),
            Section(name: "Your Trip", items: [""]),
            Section(name: "Map", items: [""]),
            Section(name: "Learn the Lingo", items: [""]),
            Section(name: "Nice to know", items: [""]),
            Section(name: "Social Media", items: [""]),
            Section(name: "Contact us", items: [""]),
            Section(name: "Log out", items:[""])
            
        ]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].items.count
    }
    
    //Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if menuItems[indexPath.section].items.count < 1 {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemcell", for: indexPath) as? MenuItemCell{
            
            cell.menuItemLbl.text = menuItems[indexPath.section].items[indexPath.row]
            
            return cell
            
        }
    //}
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return menuItems[indexPath.section].collapsed! ? 0 : 44.0
    }
    
    
    //Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = menuItems[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(menuItems[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        /*
        for item in menuItems {
            if item.items.count == 1 {
                let taprecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
                taprecognizer.numberOfTapsRequired = 1
                taprecognizer.numberOfTouchesRequired = 1
                header.addGestureRecognizer(taprecognizer)
            }
        }
 */
        
        return header
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //switch case
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segues to all VC's
        
        if indexPath == [0, 0] {
            self.performSegue(withIdentifier: "MainVC", sender: self)
        }
        else if indexPath == [1, 0] {
            self.performSegue(withIdentifier: "WhatToDoVC", sender: self)
        }
        else if indexPath == [2, 0] {
            self.performSegue(withIdentifier: "TravelGuidesVC", sender: self)
        } else if indexPath == [5, 0] {
            print("segue yourTrip")
            self.performSegue(withIdentifier: "YourTripVC", sender: self)
        } else if indexPath == [6, 0] {
            print("segue Map")
            self.performSegue(withIdentifier: "MapVC", sender: self)
        }else if indexPath == [7, 0] {
            print("segue LearnTheLingo")
            self.performSegue(withIdentifier: "LearnTheLingoVC", sender: self)
        } else if indexPath == [8, 0] {
            print("segue NiceToKnow")
            self.performSegue(withIdentifier: "NiceToKnowVC", sender: self)
        } else if indexPath == [9, 0]{
            print("segue SoMe")
            self.performSegue(withIdentifier: "SocialMediaVC", sender: self)
        } else if indexPath == [10, 0]{
            print("segue ContactUs")
            self.performSegue(withIdentifier: "ContactUsVC", sender: self)
        } else if indexPath == [11, 0]{
            let presentingViewController = self.presentingViewController
                presentingViewController?.dismiss(animated: false, completion: nil)
            print("logout") 
        }
        
        
        print("item #\(indexPath)")
        
    }
    
    func tapped(section: Int){
        print("tapped \(section)")
    }
    
    
    
}

//
// MARK: - Section Header Delegate
//
extension MenuController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !menuItems[section].collapsed
        //print(collapsed)
        
        // Toggle collapse
        menuItems[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        // Adjust the height of the rows inside the section
        tableView.beginUpdates()
        
        for i in 0 ..< menuItems[section].items.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }

        
        tableView.endUpdates()
    }
 
    /*
     try to collapse other Sections
    func collapseSections(section: Int){
        for i in 0..< menuItems.count {
            if menuItems[i].collapsed == false && !menuItems[section] {
                tableView.reloadSections(i, with: .automatic)
            }
        }
        
    }
 */
    
}
