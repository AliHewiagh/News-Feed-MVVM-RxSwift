//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation


class NewsFeedViewModel {
    
    // MARK: - Properties
    private let articleRepository: ArticleRepository
    
    
    init(articleRepository: ArticleRepository = ArticleRepository(apiClient: ApiClient())) {
        self.articleRepository = articleRepository
    }
    
}


extension NewsFeedViewModel {
    
    
    func getNewsFeed() {
//        print("FFFFFFFF :\(self.articleRepository.getAll())")
        self.articleRepository.getAlle( completion: { (result) in

            print("Result : \(result)")
       })
        
   
        
        
    }
}
