//
//  Constants.swift
//  WeatherApp
//
//  Created by Paolo Reyes on 24/03/2017.
//  Copyright © 2017 360 Logix Solutions Inc. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "90d528f089ff55a704172c6c1a5779e1"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=90d528f089ff55a704172c6c1a5779e1"
typealias DownloadComplete = () -> ()

