//
//  ApiManager.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation
import Alamofire

import RxSwift
//=================


enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}


struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

enum ApiRouter: URLRequestConvertible {
    
    //The endpoint name we'll call later
    case getPosts(userId: Int)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
        case .getPosts(let userId):
            //A dictionary of the key (From the constants file) and its value is returned
            return [Constants.Parameters.userId : userId]
        }
    }
}

struct Constants {
    
    //The API's base URL
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}


class ApiClient {
    
    
    var commenHeaders: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "X-Api-Key": "dfb49d1ebb7a43fbb566b1d81b968252p"]


    // Common Function For API Requests
    func apiRequest(url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeader?, completion: @escaping (ApiResponse)->Void ) {
        
        if let extraHeaders = headers {
            commenHeaders.add(extraHeaders)
        }
        
        AF.request(url, method: method, parameters: parameters, headers: commenHeaders).validate(statusCode: 200...299).responseJSON() { response in
            
            print("Type of \(type(of: response))")
            
            switch response.result {
            
            case .failure(let error):
                print("Error : \(error)")
                switch error {
                case .responseValidationFailed(let reason):
                    completion(.failure(.apiKeyInvalid))
              
                case .createUploadableFailed(error: let error):
                    print(error)
                case .createURLRequestFailed(error: let error):
                    print(error)
                case .explicitlyCancelled:
                    print("explixity")
                case .invalidURL(url: let url):
                    print("invalid url \(url)")
                case .multipartEncodingFailed(reason: let reason):
                    print(reason)
                case .parameterEncodingFailed(reason: let reason):
                    print(reason)
                case .parameterEncoderFailed(reason: let reason):
                    print(reason)
                case .requestAdaptationFailed(error: let error):
                    print(error.localizedDescription)
                case .responseSerializationFailed(reason: let reason):
                    print(reason)
                case .serverTrustEvaluationFailed(reason: let reason):
                    print(reason)
                case .sessionTaskFailed(error: let error):
                    print(error.localizedDescription)
                case .urlRequestValidationFailed(reason: let reason):
                    print("FFFF \(reason)")
                default :
                    print("Unkonw error")
                }
        
            case .success(let respData):
                print("Respose Data : \(respData)")
            }
        
//            completion(response)

        }
    }
    
}
