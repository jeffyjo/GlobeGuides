//
//  WeatherCell.swift
//  GlobeGuides
//
//  Created by Jeff Jørgensen on 13/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherDayLbl: UILabel!
    @IBOutlet weak var weatherTempLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(foreCast: WeatherForecast){
        weatherImg.image = UIImage(named: "\(foreCast.weatherType) Mini")
        weatherDayLbl.text = foreCast.date
        weatherTempLbl.text = "\(foreCast.forecastTemp) °C"
        
    }

}
