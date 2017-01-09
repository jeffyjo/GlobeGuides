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
    var _time: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    let dateFormatter = DateFormatter()
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var time: String{
        if _time == nil {
            _time = ""
        }
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        let currentTime = dateFormatter.string(from: Date())
        self._time = "\(currentTime)"
        
        return _time
        
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
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
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    /*
    func downloadWeatherDetails(completed: @escaping DonwloadComplete){
        //Alamofire download
        let currentWeatherURL =  URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { respons in
            let result = respons.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperatur = main["temp"] as? Double {
                        
                        let kelvinToTempC = currentTemperatur - 273.15
                        
                        self._currentTemp = Double(kelvinToTempC).rounded()
                        print(self._currentTemp)
                    }
                }
            }
        }
        completed()
    }
 */
    
    
    func downloadWeatherDetails(completed: @escaping DonwloadComplete) {
        //Download Current Weather Data
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToTempC = currentTemperature - 273.15
                        
                        self._currentTemp = Double(kelvinToTempC).rounded()
                        
                    }
                }
            }
            completed()
        }
    }

}
