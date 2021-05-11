//
//  WeatherListScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/5/21.
//
//  Modified by Aung Phyo on 5/9/21

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListScreen: View {

    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                NavigationLink(destination: WeatherDetail()){
                    WeatherCell(weather: weather)
                }
            }
            .onDelete(perform: deleteItems)
            //.onTapGesture(perform: detailView)
           
        }
        .listStyle(PlainListStyle())
        
        .sheet(item: $activeSheet, content: { (item) in
            switch item {
                case .addNewCity:
                    AddCityScreen().environmentObject(store)
                case .settings:
                    SettingsScreen().environmentObject(store)
            }
        })
        
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            activeSheet = .addNewCity
        }, label: {
            Image(systemName: "magnifyingglass")
        }))
        .navigationTitle("Cities")
        .embedInNavigationView()
        
       
    }
    
    //delete function swipe left for the list view
    func deleteItems(at offsets: IndexSet){
        store.weatherList.remove(atOffsets: offsets)
    }
    
    func detailView(){
        
        print(store.weatherList[0].city)
        print("hello")
    }
    
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    @EnvironmentObject var store: Store
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "sunrise.fill").renderingMode(.original)
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset.fill").renderingMode(.original)
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            
            URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                .frame(width: 60, height: 60)
            
            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit)))° \(String(store.selectedUnit.displayText.prefix(1)))")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium))
        }
        .padding()
        //.background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .background(Color(.gray))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}
