//
//  WeatherWidget.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 07.01.2024.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast : Forecast
    
    var body: some View {
        ZStack(alignment:.bottom) {
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            
            HStack(alignment:.bottom){
                VStack(alignment:.leading,spacing: 8){
                    Text("\(forecast.temperature)°")
                        .font(.system(size:64))
                    
                    VStack(alignment:.leading,spacing: 2){
                        Text("H:\(forecast.high)°  L:\(forecast.low)°")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                VStack(alignment:.leading,spacing: 0)
                {
                    Image("\(forecast.icon) large")
                        .padding(.trailing,4)
                    
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing,24)
                    
                }
            }
            .foregroundColor(.white)
            .padding(.bottom,20)
            .padding(.trailing,20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

#Preview {
    WeatherWidget(forecast:Forecast.cities[0])
        .preferredColorScheme(.dark)
}
