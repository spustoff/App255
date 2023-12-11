//
//  NewsDetail.swift
//  App255
//
//  Created by IGOR on 22/11/2023.
//

import SwiftUI

struct NewsDetail: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    @Environment(\.presentationMode) var router
    
    let index: NewsItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ZStack {
                            
                            WebPic(urlString: index.resultImage ?? "", width: .infinity, height: 250, cornerRadius: 0, isPlaceholder: false)
                            
                            VStack {
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                        router.wrappedValue.dismiss()
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Image(systemName: "chevron.left")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
               
                                        }
                                        .padding(9)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                                        .padding()
                                        .padding(.top, 34)
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {

                                        viewModel.favoritesManager(model: index, type: .archive)
                                        
                                    }, label: {
                                        
                                        Image(systemName: viewModel.isHas(model: index, type: .archive) ? "star.fill" : "star")
                                            .foregroundColor(viewModel.isHas(model: index, type: .archive) ? .yellow : .white)
                                            .font(.system(size: 18, weight: .regular))
                                    })
                                    .padding(9)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                                    .padding()
                                    .padding(.top, 34)                                }
                                
                                Spacer()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text(index.resultDateTime ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 1)
                            
                            Text(index.resultTitle ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text(index.resultText ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))

                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NewsDetail(index: NewsItem(resultId: 0, resultTitle: "Testy1", resultImage: "", resultMark: "", resultDateTime: "13.02.5002", resultText: "fgdgdfsgdfsgdfsgdfsgdfdfs", resultTotalLikes: 0, resultTotalComments: 0))
}
