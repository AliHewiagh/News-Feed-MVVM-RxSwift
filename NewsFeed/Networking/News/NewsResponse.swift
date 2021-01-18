//
//  NewsResponse.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 12/01/2021.
//

import Foundation

class NewsResponse: Codable {
    var data: [NewsModel]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
