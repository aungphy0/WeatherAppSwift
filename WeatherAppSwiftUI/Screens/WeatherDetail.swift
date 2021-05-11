//
//  WeatherDetail.swift
//  WeatherAppSwiftUI
//
//  Created by AUNG PHYO on 5/9/21.
//

import SwiftUI

struct WeatherDetail: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                           .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("San Jose, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   temperature: 80)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "sun.max.fill",
                                   temperature: 82)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 82)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "wind",
                                   temperature: 70)
                }
                Spacer()
            }
       }
    }
}


struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail()
    }
}
    


struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.black)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
