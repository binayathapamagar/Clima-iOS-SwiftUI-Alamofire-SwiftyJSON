//
//  ClimaView.swift
//  Clima-SwiftUI
//
//  Created by Binaya on 05/08/2021.
//

import SwiftUI

struct ClimaView: View {
    
    @State private var searchedCityName: String = ""
    @State private var showsAlert = false
    @ObservedObject private var weatherManager = WeatherManager()
    
    var body: some View {
        
        ZStack {
            
            Image(K.backgroundImageName)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    WeatherButton(buttonImageName: K.locationImageName, function: {
                        weatherManager.fetchWeatherWithCoordintes()
                    }).padding(.leading)
                    
                    TextField("Search for a city's weather", text: $searchedCityName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .frame(height: 40)
                        .background(Color(red: 0.70, green: 0.75, blue: 0.76, opacity: 0.5))
                    
                    WeatherButton(buttonImageName: K.searchImageName, function: {
                        self.endTextEditing()
                        if searchedCityName != "" {
                            weatherManager.fetchWeather(with: searchedCityName.trimmingCharacters(in: .whitespacesAndNewlines))
                            searchedCityName = ""
                        }else {
                            self.showsAlert.toggle()
                        }
                        
                    })
                    .padding(.trailing)
                    .alert(isPresented: self.$showsAlert) {
                        Alert(title: Text("Please enter a valid city name."))
                    }
                    
                }
                
                HStack {
                    Spacer()
                    Image(systemName: weatherManager.getWeatherCondition())
                        .resizable().frame(width: 100, height: 100)
                        .padding(.trailing)
                }.padding(.top)
                
                HStack{
                    Spacer()
                    WeatherText(degrees: weatherManager.getTemp(), fontSize: 100, fontWeight: .black)
                    WeatherText(degrees: "o", fontSize: 50, fontWeight: .bold)
                        .frame(width: 50, height: 100, alignment: .top)
                    WeatherText(degrees: "C", fontSize: 100, fontWeight: .light)
                        .padding(.trailing)
                }
                
                HStack {
                    Spacer()
                    Text(weatherManager.getCity())
                        .font(.system(size: 35.0))
                        .fontWeight(.medium)
                        .padding(.trailing)
                }.padding(.top)
                
                Spacer()
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                weatherManager.fetchWeatherWithCoordintes()
            }
        })
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

//MARK: - Extension to dismiss keyboard

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
    }
}

//MARK: - Preview


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClimaView()
    }
}
