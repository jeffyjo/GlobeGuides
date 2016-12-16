//
//  WeatherConstants.swift
//  GlobeGuides
//
//  Created by Jeff Jørgensen on 15/12/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import Foundation

//http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=79b79466ce5da727349781fe319ffab0

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let CITY = "London"
let COUNTRY = "uk"
let APIKEY = "79b79466ce5da727349781fe319ffab0"

typealias DonwloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)q=\(CITY),\(COUNTRY)&appid=\(APIKEY)"


