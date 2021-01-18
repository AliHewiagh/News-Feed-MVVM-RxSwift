//
//  NewsAPI.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 12/01/2021.
//

import Foundation

protocol NewsAPIProtocol {
    func getNewsList(completion: @escaping (Result<BaseResponse<[NewsModel]>?, NSError>) -> Void)
}

class NewsAPI: BaseAPI<NewsNetworking>, NewsAPIProtocol {
    
    // MARK:- Requests

    func getNewsList(completion: @escaping (Result<BaseResponse<[NewsModel]>?, NSError>) -> Void) {
        self.request(target: .getNewsList, responseClass: BaseResponse<[NewsModel]>.self) { (result) in
            completion(result)
        }
    }
}
