//
//  Constants.swift
//  Clima-SwiftUI
//
//  Created by Binaya on 06/08/2021.
//

import Foundation

struct K {
    
    static let backgroundImageName = "background"
    static let locationImageName = "location.circle.fill"
    static let searchImageName = "magnifyingglass"
    
    struct weatherAPI {
        
        static let weatherByCityURL = "https://api.openweathermap.org/data/2.5/weather?appid=&units=metric"
        
        static let weatherByGeoCoordinatesURL = "https://api.openweathermap.org/data/2.5/weather?appid=&units=metric"
        
        static let parameters : [String:String] = [
            "data" : "",
            "2.5" : "",
            "weather" : "",
            "appid" : "4a085f38c3d3ffeabd6caaff61a5a9bd",
            "units" : "metric",
            "q" : "london"
        ]

        
    }
    
}
