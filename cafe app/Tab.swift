//
//  Tab.swift
//  Cheech
//
//  Created by Артур on 07.10.2020.
//

import Foundation
import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab : String
    var body: some View {
        
        HStack(spacing: 30){
            
            TabButton(title: "Меню", selectedTab: $selectedTab)
            
            TabButton(title: "Аккаунт", selectedTab: $selectedTab)
            
            TabButton(title: "Карта", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.init(#colorLiteral(red: 0.8057331443, green: 0.795502007, blue: 0.813059628, alpha: 1)))
        .clipShape(Capsule())
    }
}

struct TabButton : View {
    
    var title : String
    
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = title}) {
            
            VStack(spacing: 5){
                
                Image(title).renderingMode(.template)
                    .resizable().frame(width: 30, height: 30)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold).lineLimit(1)
            }
            .foregroundColor(selectedTab == title ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : .gray)
            .padding(.horizontal)
            .padding(.vertical,10)
        }
    }
}
