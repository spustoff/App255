//
//  NewsView.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("News")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            FavoritsNews()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                        })
                    }
                }
                .padding()
                
                VStack {
                    
                    Text("Last news")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.news.isEmpty {
                            
                            VStack {
                                
                                Image("empty")
                                
                                Text("Empty news")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("No any news we have")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .frame(height: 100)
                            
                        } else {
                            
                            ScrollView(.horizontal, showsIndicators: true) {
                                
                                LazyHStack {
                                    
                                    ForEach(viewModel.news, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedNews = index
                                            viewModel.isDetail = true
                                            
                                        }, label: {
                                            
                                            HStack {
                                                
                                                WebPic(urlString: index.resultImage ?? "", width: 210, height: 140, cornerRadius: 5, isPlaceholder: false)
                                                    .overlay(
                                                        
                                                        VStack(alignment: .leading, spacing: 6) {
                                                            
                                                            Spacer()
                                                            
                                                            Text(index.resultDateTime ?? "")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 13, weight: .regular))
                                                            
                                                            Text(index.resultTitle ?? "")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 15, weight: .medium))
                                                                .lineLimit(3)
                                                                .multilineTextAlignment(.leading)
                                                        }
                                                            .padding(7)
                                                    )
                                                
                                                Spacer()
                                            }
                                            .padding(.vertical)
                                        })
                                    }
                                }
                            }
                            .frame(height: 150)
                        }
                    }
                    
                    Text("All news")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.news.isEmpty {
                            
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
                                    
                                    ForEach(viewModel.news, id: \.self) { index in
                                        
                                        NavigationLink(destination: {
                                            
                                            NewsDetail(index: index)
                                            
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
//        .sheet(isPresented: $viewModel.isDetail, content: {
//
//            if let index = viewModel.selectedNews {
//
//                NewsDetail(index: index)
//            }
//        })
    }
}

#Preview {
    NewsView()
}
