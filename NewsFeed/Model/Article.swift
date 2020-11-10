//
//  Article.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//


import UIKit

struct Article: Codable, Equatable {
    
    let description: String


    enum CodingKeys: String, CodingKey {
            case description
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
       return true
    }
}


extension Article {
    init?(data: Data) {
        guard let mo = try? JSONDecoder().decode(Article.self, from: data) else {
            return nil }
        self = mo
    }
}

