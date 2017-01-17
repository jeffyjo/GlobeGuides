//
//  WeatherForecast.swift
//  GlobeGuides
//
//  Created by Jeff Jørgensen on 16/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import Foundation

class WeatherForecast{
    
    var _date: String!
    var _weatherType: String!
    var _foreCastTemp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var forecastTemp: Double {
        if _foreCastTemp == nil {
            _foreCastTemp = 0.0
        }
        
        return _foreCastTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let dailyTemp = temp["day"] as? Double {
                
                self._foreCastTemp = dailyTemp.rounded()
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
             
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
    }
    
    init(){}
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
