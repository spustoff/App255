//
//  U1.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Your income assistant")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Make important decisions to earn money")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
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
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
