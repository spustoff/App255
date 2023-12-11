//
//  Join.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {
        
        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Join")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Join and earn")
                            .foregroundColor(Color(red: 0/255, green: 174/255, blue: 237/255))
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Join our Telegram group trade with our team")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
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
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
