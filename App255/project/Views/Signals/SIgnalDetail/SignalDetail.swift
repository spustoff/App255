//
//  SignalDetail.swift
//  App255
//
//  Created by IGOR on 22/11/2023.
//

import SwiftUI

struct SignalDetail: View {
    
    @StateObject var viewModel = SignalsViewModel()
    
    @Environment(\.presentationMode) var router
    
    let index: String
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("chart_png")
                    .resizable()
                
                VStack {
                    
                    HStack {
                        
                        Text(index)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                     
                        Spacer()
                        
                        Button(action: {

                            viewModel.favoritesManager(index)
                            
                        }, label: {
                            
                            Image(systemName: viewModel.isFavorited(index) ? "star.fill" : "star")
                                .foregroundColor(viewModel.isFavorited(index) ? .yellow : .gray)
                                .font(.system(size: 14, weight: .regular))
                        })
                    }
                    
                    HStack {
                        
                        Text("0.\(String(format: "%.f", Double(.random(in: 3000...9800))))")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        if viewModel.int == 1 {
                            
                            Text("+1.\(String(format: "%.f", Double(.random(in: 30...98))))")
                                .foregroundColor(.green)
                                .font(.system(size: 11, weight: .semibold))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                            
                        } else {
                            
                            Text("-1.\(String(format: "%.f", Double(.random(in: 30...98))))")
                                .foregroundColor(.red)
                                .font(.system(size: 11, weight: .semibold))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))                        }
                        
                        Spacer()
                        
                        if viewModel.int == 1 {
                            
                            Image("gp")
                            
                        } else {
                            
                            Image("gm")
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.white.opacity(0.1))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Stop loss")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("1.\(String(format: "%.f", Double(.random(in: 1000...10000))))")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Take profit")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("1.\(String(format: "%.f", Double(.random(in: 1000...10000))))")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Timeframe")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("M1")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 14, weight: .medium))
                        }
                        
                        Spacer()
   
                    }
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(width: 190, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignalDetail(index: "EURUSD")
}
