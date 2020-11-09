//
//  ArticleRepositry.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation


class ArticleRepository: Repository {
    
    
    // MARK: - Private Properties
    private let apiManager: ApiManager
    
    // MARK: - Designated Initializer
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
}


extension ArticleRepository {
    
    
    func getAll() -> [Article] {
      return []
    }
      
      
    func get( identifier:Int ) -> Article? {
      return Article()
    }
    func create( a:Article ) -> Bool {
      return true
    }
    func update( a:Article ) -> Bool {
      return true
    }
    func delete( a:Article ) -> Bool {
      return true
    }
}
