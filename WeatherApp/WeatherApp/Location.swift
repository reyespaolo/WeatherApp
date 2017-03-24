//
//  Location.swift
//  WeatherApp
//
//  Created by Paolo Reyes on 24/03/2017.
//  Copyright © 2017 360 Logix Solutions Inc. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
    
}
