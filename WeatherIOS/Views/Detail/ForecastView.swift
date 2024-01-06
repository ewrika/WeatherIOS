//
//  ForecastView.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 30.12.2023.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated : CGFloat = 1
    @State private var selection = 0
    
    var body: some View {
        ScrollView{
            VStack(spacing:0){
                SegmentedControl(selection: $selection)
                
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing : 12){
                        if selection == 0 {
                            ForEach(Forecast.hourly){forecast in
                                ForecastCard(forecast: forecast, forecastPeriod:.hourly)
                            }
                            .transition(.offset(x:-430))
                        } else {
                            ForEach(Forecast.weekly){forecast in
                                ForecastCard(forecast: forecast, forecastPeriod:.weekly)
                            }
                            .transition(.offset(x:430))

                        }
                    }
                    .padding(.vertical,20)
                }
                .padding(.horizontal,20)
                
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }
        }
        .background(.ultraThinMaterial)
       //.background(Blur(radius: 25,opaque: true))
       // .backgroundBlur(radius: 25,opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44),color:Color.bottomSheetBorderMiddle,lineWidth:1,offsetX:0,offsetY:1,blur:0,blendMode:.overlay,opacity:1 - bottomSheetTranslationProrated)
        .overlay{
            RoundedRectangle(cornerRadius: 44)
                .stroke(Color.bottomSheetBorderMiddle,lineWidth: 1)
                .blendMode(.overlay)
                .offset(y:1)
                .blur(radius: 0)
                .mask{
                    RoundedRectangle(cornerRadius: 44)                }
        }
        .overlay{
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight:.infinity,alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay{
            //
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48,height: 5)
                .frame(height: 20)
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .top)
        }
    }
}

#Preview {
    ForecastView()
        .background(Color.background)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
