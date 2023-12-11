//
//  Not.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Don’t miss anything")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Don’t miss the most userful information")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 45/255, green: 129/255, blue: 255/255)))
                            .padding()
                    })
                }
                .padding()
                .frame(height: UIScreen.main.bounds.height / 2.7)
                .background(Color("bg").ignoresSafeArea())
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
