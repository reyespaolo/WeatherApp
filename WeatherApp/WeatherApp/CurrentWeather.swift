//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Paolo Reyes on 24/03/2017.
//  Copyright © 2017 360 Logix Solutions Inc. All rights reserved.
//

import UIKit
import Alamofire

//private var _cityName: String!
//private var _date: String!
//private var _weatherType: String!
//private var _currentTemp: Double!

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!

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
        let  datFormatter = DateFormatter()
        datFormatter.dateStyle = .long
        datFormatter.timeStyle = .none
        let currentDate = datFormatter.string(from:Date())
        self._date = "Today, \(currentDate)"
        return _date
    }

    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
//        let currentWeatherURL = URL(string:CURRENT_WEATHER_URL)
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
//            print (result.value)

            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                                print (name.capitalized)

                }
                
//                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currentTemperature  = main["temp"] as? Double {
                        let kelvinToFarenheitPreDevision = (currentTemperature * (9/5)-459.67)
                        let  kelvinToFarenheit = Double(round(10*kelvinToFarenheitPreDevision/10))
                        self._currentTemp = kelvinToFarenheit
                        
                    }
                }
                             

                
            }
            completed()


        }

    }
    
    
    
}
