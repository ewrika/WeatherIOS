//
//  HomeView.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 25.12.2023.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition : CGFloat , CaseIterable {
    
    case middle = 0.385 // 325/844
    case top = 0.83 //702/844
}


struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    var body: some View {
        NavigationView {
            ZStack{
                Color.background.ignoresSafeArea()
                Image("Background").resizable()
                    .ignoresSafeArea()
                    
                Image("House")
                    .frame(maxHeight:  .infinity,alignment: .top)
                    .padding(.top,257)
                
                VStack(spacing:-10){
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack{
                        Text(attributedString)
                        
                        Text("H:24° L:18°")
                    }
                    
                    Spacer()
                }
                .padding(.top,51)
                BottomSheetView(position: $bottomSheetPosition){
               //     Text(bottomSheetPosition.rawValue.formatted())
                }content:{
                    ForecastView()
                }
                TabBar(action: {})
            }
            .navigationBarHidden(true)
        }
    }
    
        
    private var attributedString : AttributedString{
        var string = AttributedString("19°" + "\n" + "Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size:96,weight:.thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
