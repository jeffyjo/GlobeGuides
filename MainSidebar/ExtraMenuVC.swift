//
//  ExtraMenuVC.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 04/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit

protocol WeatherServiceDelegate{
    func setWeather(weather: Weather)
}

class ExtraMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            //Setup UI to download data
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell
        
        //cell?.weatherImg
        cell?.weatherDayLbl.text = "Day"
        cell?.weatherTempLbl.text = "temp"
        
        return cell!
    }
    
    func updateUI(){
        dayLbl.text = currentWeather._date
        //timeLbl.text = currentWeather.
        tempLbl.text = "\(currentWeather._currentTemp)"
    }
    
}
