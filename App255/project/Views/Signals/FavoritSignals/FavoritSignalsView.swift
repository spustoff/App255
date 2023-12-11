//
//  FavoritSignalsView.swift
//  App255
//
//  Created by IGOR on 21/11/2023.
//

import SwiftUI

struct FavoritSignalsView: View {
    
    @StateObject var viewModel = SignalsViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Favorites")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                                                
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                            }
                        })
                        
                        Spacer()

                    }
                }
                .padding()
                
                if viewModel.signals_saved.isEmpty {
                    
                    
                    VStack(spacing: 9) {
                        
                        Image("empty")
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("You don't have any added currencies in your portfolio yet")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .background(Color("bg"))
                    .ignoresSafeArea(.all, edges: .bottom)
                    
                } else {
                    
                    VStack {
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            LazyVStack {
                                
                                ForEach(viewModel.signals_saved, id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        SignalDetail(index: index)
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        VStack {
                                            
                                            HStack{
                                                
                                                Text(index)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Spacer()
                                                
                                                Text("M1")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 13, weight: .medium))
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    
                                                    Text("1.\(String(format: "%.f", Double(.random(in: 1000...10000))))")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Text("+1.\(String(format: "%.f", Double(.random(in: 100...1000))))")
                                                        .foregroundColor(viewModel.int == 1 ? .green : .red)
                                                        .font(.system(size: 10, weight: .medium))
                                                    
                                                    Text("\(viewModel.int)")
                                                        .opacity(0)
                                                }
                                                
                                                Button(action: {
          
                                                    viewModel.favoritesManager(index)
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: viewModel.isFavorited(index) ? "star.fill" : "star")
                                                        .foregroundColor(viewModel.isFavorited(index) ? .yellow : .gray)
                                                        .font(.system(size: 14, weight: .regular))
                                                })
                                            }
                                            
                                            RoundedRectangle(cornerRadius: 2)
                                                .fill(.white.opacity(0.1))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 1)
                                            
                                            HStack {
                                                
                                                VStack {
                                                    
                                                    Text("Stop loss")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 12, weight: .regular))
                                                    
                                                    Text("1.\(String(format: "%.f", Double(.random(in: 1000...10000))))")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                }
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    
                                                    Text("Stop loss")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 12, weight: .regular))
                                                    
                                                    Text("1.\(String(format: "%.f", Double(.random(in: 1000...10000))))")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                }
                                                
                                                Spacer()
                                                
                                                if viewModel.int == 1 {
                                                    
                                                    Image("gp")
                                                    
                                                } else {
                                                    
                                                    Image("gm")
                                                }
                                            }
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                                        .padding(.horizontal)
                                    })
                                }
                            }
                        }
                        .padding(.top)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("bg"))
                    .ignoresSafeArea(.all, edges: .bottom)
                }
            }
        }
    }
}

#Preview {
    FavoritSignalsView()
}
