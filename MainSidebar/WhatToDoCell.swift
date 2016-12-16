//
//  WhatToDoCell.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 10/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class WhatToDoCell: UITableViewCell {

    @IBOutlet weak var WhatToDoView: UIView!
    
    @IBOutlet weak var whatLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func styling(){
        WhatToDoView.layer.borderWidth = 0.5
        WhatToDoView.layer.borderColor = UIColor(hex: 0x036B34).cgColor
        
        WhatToDoView.layer.masksToBounds = true
        WhatToDoView.layer.shadowColor = UIColor.darkGray.cgColor
        WhatToDoView.layer.shadowOffset = CGSize(width: 100, height: 100)
        WhatToDoView.layer.shadowRadius = 5
        WhatToDoView.layer.shadowOpacity = 0.5
    }

}
