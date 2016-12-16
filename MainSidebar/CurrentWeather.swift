//
//  CurrentWeather.swift
//  GlobeGuides
//
//  Created by Jeff Jørgensen on 16/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let currentDate = dateFormatter.string(from: Date())
        self._date = "\(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double{
        if _currentTemp == nil {
            _currentTemp = 0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DonwloadComplete){
        //Alamofire download
        let currentWeatherURL =  URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { respons in
            let result = respons.result
            print(respons)
            print(result)
        }
        completed()
    }
}
