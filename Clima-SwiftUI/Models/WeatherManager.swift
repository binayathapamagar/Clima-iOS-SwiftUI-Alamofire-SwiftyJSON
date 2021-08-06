//
//  WeatherManager.swift
//  Clima-SwiftUI
//
//  Created by Binaya on 06/08/2021.
//

import SwiftUI
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherManager: ObservableObject {
    
    @ObservedObject var locationManager = LocationManager()
    @Published private var temp = "25"
    @Published private var city = "Lalitpur"
    @Published private var weatherCondition = "sun.max"
    
    func getTemp () -> String {
        return temp
    }
    
    func getCity () -> String {
        return city
    }
    
    func getWeatherCondition () -> String {
        return weatherCondition
    }
    
    func fetchWeather(with cityName: String) {
        let apiURL = "\(K.weatherAPI.weatherByCityURL)&q=\(cityName)"
        performRequest(with: apiURL)
    }
        
    func fetchWeatherWithCoordintes() {
        let apiURL = "\(K.weatherAPI.weatherByGeoCoordinatesURL)&lat=\(locationManager.coordiates.latitude)&lon=\(locationManager.coordiates.latitude)"
        performRequest(with: apiURL)
    }
    
    func performRequest(with url: String) {
        
        AF.request(url, method: .get).responseJSON { response in
            
            if response.error == nil {
            
                DispatchQueue.main.async {
                    
                    let weatherJSON = JSON(response.value!)

                    self.city = weatherJSON["name"].stringValue
                    let temperature = weatherJSON["main"]["temp"].double ?? 0.0
                    let conditionID = weatherJSON["weather"][0]["id"].int ?? 0
                    
                    let weatherData = WeatherData(cityName: self.city, temperature: temperature, conditionID: conditionID)
                    
                    self.temp = weatherData.tempAs1Dp
                    self.weatherCondition = weatherData.conditionName
                }
                
                
            }else {
                
                DispatchQueue.main.async {
                    self.city = "NOTE: Error fetching data. City names cannot have spacing. (Might be one of the problem)"
                    self.temp = "ERROR"
                }
                
            }
            
        }
        
    }
    
}
