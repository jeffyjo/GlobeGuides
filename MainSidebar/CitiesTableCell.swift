//
//  CitiesTableCell.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 16/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class CitiesTableCell: UITableViewCell {
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var cityImg: UIImageView!
    
    func updateUI(city: City){
        cityLbl.text = city.cityName
        cityImg.image = city.cityImg
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
