//
//  R1.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI

struct R1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Useful news")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Only important news for you")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
