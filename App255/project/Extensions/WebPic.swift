//
//  WebPic.swift
//  App255
//
//  Created by IGOR on 21/11/2023.
//

import SwiftUI
import Kingfisher

struct WebPic: View {

    var urlString: String

    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    let isPlaceholder: Bool

    var body: some View {

        if let url = URL(string: urlString) {
            
            let resource = KF.ImageResource(downloadURL: url, cacheKey: "\(url.absoluteString)")
            
            KFImage(source: .network(resource))
                .resizable()
                .placeholder {

                    if isPlaceholder {
                        
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: width, height: height)
                            .cornerRadius(cornerRadius)
                            .overlay (

                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13))
                            )
                    }
                }
                .downsampling(size: CGSize(width: width, height: height))
                .cacheOriginalImage()
                .frame(width: width, height: height)
                .cornerRadius(cornerRadius)
        }
    }
}
