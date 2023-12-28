//
//  TabBar.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 25.12.2023.
//

import SwiftUI

struct TabBar: View {
    
    var action :() -> Void
    
    
    var body: some View {
        ZStack{
            
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay{
                    Arc()
                        .stroke(Color.tabBarBorder,lineWidth: 0.5)
                }
            
            HStack{
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44,height: 44)
                }
                    Spacer()
                NavigationLink{
                    
                }label: {
                    Image(systemName: "list.star")
                        .frame(width: 44,height: 44)
                }
                
            }.font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
        }   .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    TabBar(action: {}).preferredColorScheme(.dark)
}
