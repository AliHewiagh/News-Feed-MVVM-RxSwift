//
//  NewsNetworking.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 12/01/2021.
//

import Foundation
import Alamofire

enum NewsNetworking {
    case getNewsList
}





extension NewsNetworking: TargetType {
    var baseURL: String {
        switch self {
        
        default:
            return "https://newsapi.org/v2"
        }
    }
    
    var path: String {
        switch self {
        case .getNewsList:
            return "/everything?q=bitcoin&sortBy=publishedAt&apiKey=dfb49d1ebb7a43fbb566b1d81b968252"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNewsList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        
        case .getNewsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
      
    }
    
    
}
