//
//  WeatherView.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 07.01.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var searchText = ""
    
    var searchResults:[Forecast]{
        if searchText.isEmpty{
            return Forecast.cities
        }else{
            return Forecast.cities.filter({$0.location.contains(searchText)})
        }
    }
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators:false){
                VStack(spacing:20){
                    ForEach(searchResults){forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
                .safeAreaInset(edge: .top){
                    EmptyView()
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }
            }//T
            
        }
        .overlay{
            NavigationBar(searchtext: $searchText)
        }
        .navigationBarHidden(true)
    //    .searchable(text:$searchText, placement: .navigationBarDrawer(displayMode: .always),prompt: "Search city")
    }
}

#Preview {
    NavigationView{
        WeatherView().preferredColorScheme(.dark)
    }
}
