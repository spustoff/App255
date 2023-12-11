//
//  FavoritsNews.swift
//  App255
//
//  Created by IGOR on 22/11/2023.
//

import SwiftUI

struct FavoritsNews: View {
    
    @StateObject var viewModel = NewsViewModel()
    
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
                
                VStack {
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.news.filter{viewModel.archive_items.contains($0.resultTitle ?? "")}.isEmpty {
                            
                            VStack {
                                
                                Image("empty")
                                
                                Text("Empty news")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("No any news we have")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                LazyVStack(spacing: 12) {
                                    
                                    ForEach(viewModel.news.filter{viewModel.archive_items.contains($0.resultTitle ?? "")}, id: \.self) { index in
                                        
                                        NavigationLink(destination: {
                                            
                                            NewsDetail(index: index)
                                                .navigationBarBackButtonHidden()
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    WebPic(urlString: index.resultImage ?? "", width: 90, height: 90, cornerRadius: 5, isPlaceholder: false)
                                                    
                                                    VStack(alignment: .leading, spacing: 12, content: {
                                                        
                                                        HStack {
                                                            
                                                            Text(index.resultDateTime ?? "")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 13, weight: .regular))
                                                            
                                                            Spacer()
                                                            
                                                            Button(action: {
                                                                
                                                                viewModel.favoritesManager(model: index, type: .archive)
                                                                
                                                            }, label: {
                                                                
                                                                Image(systemName: viewModel.isHas(model: index, type: .archive) ? "star.fill" : "star")
                                                                    .foregroundColor(viewModel.isHas(model: index, type: .archive) ? .yellow : .gray)
                                                                    .font(.system(size: 17, weight: .regular))
                                                            })
                                                        }
                                                        
                                                        Text(index.resultTitle ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 15, weight: .medium))
                                                            .lineLimit(3)
                                                            .multilineTextAlignment(.leading)
                                                        
                                                    })
                                                    
                                                    Spacer()
                                                }
                                                
                                                RoundedRectangle(cornerRadius: 2)
                                                    .fill(.white.opacity(0.1))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 1)
                                            }
                                        })
                                    }
                                }
                            }
                        }
                    }                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg"))
                .ignoresSafeArea(.all, edges: .bottom)
                
            }
        }
        .onAppear {
            
            viewModel.getNews()
        }
    }
}

#Preview {
    FavoritsNews()
}
