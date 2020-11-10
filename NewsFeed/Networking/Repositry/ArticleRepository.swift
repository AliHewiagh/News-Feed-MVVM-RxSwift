//
//  ArticleRepositry.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation

import Alamofire
import SwiftyJSON
import RxSwift


enum ApiErrorResponse: Error {
    case apiKeyDisabled
    case apiKeyExhausted
    case apiKeyInvalid
    case apiKeyMissing
    case parameterInvalid
    case parametersMissing
    case rateLimited
    case sourcesTooMany
    case sourceDoesNotExist
    case unexpectedError
}


enum ApiResponse {
    case success(String)
    case failure(ApiErrorResponse)
}


class ArticleRepository: Repository {

   
    
    let url = "https://newsapi.org/v2/top-headlines?country=us"
    
    private let disposeBag = DisposeBag()
    // MARK: - Private Properties
    private let apiClient: ApiClient
    
    // MARK: - Designated Initializer
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
}


extension ArticleRepository {
    func getAll() -> [Article] {
        
        return []
    }
    
    
    func getAlle(completion: @escaping (ApiResponse)-> Void) {

        
        self.apiClient.apiRequest(url: url, method: .get, parameters: nil, headers: nil, completion: {(response) -> Void in
            
            
            switch response {
            case .success(let data) :
               print("Data : \(data)")
            case .failure(let failure) :
                switch failure {
                case .apiKeyInvalid:
                    completion(.failure(.apiKeyInvalid))
                default:
                    completion(.failure(.unexpectedError))
                }
            }

//            print("Data Response : \(DataResponse)")
//            switch DataResponse.result {
//
//            case .failure(let error):
//                print("Failure : \(error)")
//             
//
//            case .success(let returnJson):
//                let josnData = JSON(returnJson)
//
//               
//                print("Type Of result \(type(of: josnData))")
//                debugPrint("ssssss \(josnData)")
//
//                print("Success : \(josnData["articles"])")
//                let articlesList = josnData["articles"].arrayValue.compactMap {  return Article(data: try! $0.rawData()) }
//                print("articlesList : \(articlesList)")
//            }

           })
    }
      
      
    func get( identifier:Int ) -> Article? {
        return Article(description: "3")
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




