//
//  TabBar.swift
//  App255
//
//  Created by IGOR on 22/11/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Image(index.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .frame(width: 26, height: 26)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 30)
        .background(Color("bg3"))
    }
}

enum Tab: String, CaseIterable {
    
    case Signals = "Signals"
    
    case News = "News"
    
    case Portfolio = "Portfolio"
    
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}
