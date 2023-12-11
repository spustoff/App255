//
//  SettingsView.swift
//  App255
//
//  Created by IGOR on 20/11/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.presentationMode) var router
    @State var isReset: Bool = false
    @AppStorage("signals_saved") var signals_saved: [String] = []
    @AppStorage("archive_items") var archive_items: [String] = []
    @AppStorage("currencies") var currencies: [String] = []
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("prim"))
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Rate app")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                }
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg3")))
                            
                            Button(action: {
                                
                                guard let url = URL(string: decodeBase64("https://docs.google.com/document/d/1cEAEZlR4tjyjBw7Fn0o_9eN3BXGWsIgRVpfGs0CgWwk/edit?usp=sharing")) else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "bubble.right.fill")
                                        .foregroundColor(Color("prim"))
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Usage Policy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                }
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg3")))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    isReset = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Reset progress")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                }
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg3")))
                        }
                    }
                    .padding()
                }
                .background(Color("bg"))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Your entire progress will be permanently deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                        })
                        
                        Button(action: {
                            
                            signals_saved.removeAll()
                            currencies.removeAll()
                            archive_items.removeAll()
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
