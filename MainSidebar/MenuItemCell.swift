//
//  MenuItemCell.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 21/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {

    @IBOutlet weak var menuItemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
