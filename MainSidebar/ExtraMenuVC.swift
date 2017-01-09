//
//  ExtraMenuVC.swift
//  MainSidebar
//
//  Created by Jeff Jørgensen on 04/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import UIKit
import Alamofire

class ExtraMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
    var currentWeather: CurrentWeather!
    
    var forecast: WeatherForecast!
    var forecasts: [WeatherForecast]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentWeather = CurrentWeather()
        forecast = WeatherForecast()
        forecasts = [WeatherForecast]()
        
        currentWeather.downloadWeatherDetails {
            //Setup UI to download data
            self.downloadForecastData {
                self.updateUI()
            }
        }
    }
    
    func downloadForecastData(completed: @escaping DonwloadComplete){
        //Downloading forecast weather data for TableView
        
        let forecastURL = URL(string: FORECAST_WEATHER_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    print(list)
                    
                    for obj in list {
                        let forecast = WeatherForecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.weatherTableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
        
            let forecast = forecasts[indexPath.row]
            cell.configureCell(foreCast: forecast)
        
        return cell
            
        } else {
        
            return WeatherCell()
        }
    }
    
    func updateUI(){
        dayLbl.text = currentWeather.date
        timeLbl.text = currentWeather.time
        tempLbl.text = "\(currentWeather.currentTemp) °C"
        weatherImgView.image = UIImage(named: currentWeather.weatherType)
    }
}
