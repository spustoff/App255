//
//  NewsViewModel.swift
//  App255
//
//  Created by IGOR on 21/11/2023.
//

import SwiftUI
import Alamofire

final class NewsViewModel: ObservableObject {

    
    @Published var isLoading: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var news: [NewsItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedNews: NewsItem?
        
    func getNews() {
        
        isLoading = true
        
        self.fetchNews { result in
            
            switch result {
                
            case .success(let success):
                
                self.news = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchNews(completion: @escaping (Result<NewsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "6451df67-47ef-4320-b53a-9a8f654293b4",
        ]
        
        let request = AF.request(decodeBase64("https://rereteper.space/api/v2/news"), method: .get, parameters: params)
        
        request.responseDecodable(of: NewsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
    
    @AppStorage("like_items") var like_items: [String] = []
    @AppStorage("dislike_items") var dislike_items: [String] = []
    @AppStorage("archive_items") var archive_items: [String] = []
    
    func isHas(model: NewsItem, type: FavoritesTypeN) -> Bool {
        
        switch type {
        case .like:
            return like_items.contains(model.resultTitle ?? "")
        case .dislike:
            return dislike_items.contains(model.resultTitle ?? "")
        case .archive:
            return archive_items.contains(model.resultTitle ?? "")
        }
    }
    
    func favoritesManager(model: NewsItem, type: FavoritesTypeN) {
        
        switch type {
            
        case .like:
            if like_items.contains(model.resultTitle ?? "") {
                
                if let indexer = like_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    like_items.remove(at: indexer)
                }
                
            } else {
                
                like_items.append(model.resultTitle ?? "")
            }
            
        case .dislike:
            if dislike_items.contains(model.resultTitle ?? "") {
                
                if let indexer = dislike_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    dislike_items.remove(at: indexer)
                }
                
            } else {
                
                dislike_items.append(model.resultTitle ?? "")
            }
            
        case .archive:
            if archive_items.contains(model.resultTitle ?? "") {
                
                if let indexer = archive_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    archive_items.remove(at: indexer)
                }
                
            } else {
                
                archive_items.append(model.resultTitle ?? "")
            }
        }
    }
}

