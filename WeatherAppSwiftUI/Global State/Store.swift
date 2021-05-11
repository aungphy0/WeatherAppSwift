//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/9/21.
//
//  Modified by Aung Phyo on 5/9/21

import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .kelvin 
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    init(){
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        //weatherList.append(weather)
        weatherList.insert(weather, at: 0)
    }
    
}
