//
//  PortfolioView.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI

struct PortfolioView: View {
    
    @StateObject var viewModel = PortfolioViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Total balance")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$\(viewModel.balance).00")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                
                VStack {
                    
                    if viewModel.currencies.isEmpty {
                        
                        VStack(spacing: 9) {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("You don't have any added currencies in your portfolio yet")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCurrency = true
                                }
                                
                            }, label: {
                                Text("Add currency")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            })
                            .padding()
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCurrency = true
                            }
                            
                        }, label: {
                            Text("Add currency")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .padding()
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            ForEach(viewModel.currencies, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text("$\(String(format: "%.2f", Double(.random(in: 10000...13000))))")
                                            .foregroundColor(.white.opacity(0.6))
                                            .font(.system(size: 12, weight: .medium))

                                    }
         
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        
                                        Text("1.\(String(format: "%.f", Double(.random(in: 10000...90000))))")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text("+\(String(format: "%.1f", Double(.random(in: 1...4))))%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.white.opacity(0.1))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(.bottom)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("bg"))
                .ignoresSafeArea()
                
            }
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCurrency ? 0.7 : 0)
                    .ignoresSafeArea()
                    .onTapGesture{
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCurrency = false
                        }
                    }
                
                VStack {
                    
                    Text("Adding a currency")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom)
                    
//                    ScrollView(.vertical, showsIndicators: false) {
//                    
                    ForEach(viewModel.currency_fc, id: \.self) { index in
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 9, content: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("\(String(format: "%.5f", Double(.random(in: 1...2))))")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 12))
                                
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.currencies.append(index)
                                
                            }, label: {
                                
                                if viewModel.currencies.contains(index) {
                                    
                                    Text("Added")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(width: 90, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                    
                                } else {
                                    
                                    Text("Add")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(width: 90, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                }
                            })
                            .disabled(viewModel.currencies.contains(index) ? true : false)
                            .opacity(viewModel.currencies.contains(index) ? 0.5 : 1)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
//                }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")).ignoresSafeArea())
                .offset(y: viewModel.isAddCurrency ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        )
    }
}

#Preview {
    PortfolioView()
}
