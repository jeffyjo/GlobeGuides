//
//  City.swift
//  Sidebar
//
//  Created by Jeff Jørgensen on 16/11/2016.
//  Copyright © 2016 Jeff Jørgensen. All rights reserved.
//

import Foundation

class City{
    private var _cityName: String!
    private var _img: UIImage!
    
    init (cityname: String, img: UIImage){
         _cityName = cityname
        _img = img
    }
    
    init(){}
    
    var cityName: String {
        get {
            return _cityName
        } set {
            _cityName = newValue
        }
    }
    
    var cityImg: UIImage {
        get {
            return _img
        } set {
            _img = newValue
        }
    }
}
