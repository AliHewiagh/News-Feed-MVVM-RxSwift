//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation

protocol NewsFeedViewModelProtocol {
//    var didFetchData: (()->())? { get set }
//    var didFail: ((_ error: String)->())? { get set }
//    var currentWeather: WeatherVMProtocol? { get }
//    var hourlyWeather: [WeatherVMProtocol]? { get }
//    var dailyWeather: [DailyWeatherVMProtocol]? { get }
    func setDependencies(provider: NewsAPIProtocol)
    func getNewsFeed()
}


class NewsFeedViewModel {
    
    
    
    // MARK: - Properties
    private var provider: NewsAPIProtocol?
    
    
    init() {
        
    }
    
}


extension NewsFeedViewModel {
    
    func setDependencies(provider: NewsAPIProtocol) {
        self.provider = provider
    }
    
    func getNewsFeed() {
        print("ddddd")
        self.provider?.getNewsList(completion: { (result) in
            print("Result: \(result)")
            switch result {
            case .success(let newsResponse):
                print("sucess : \(newsResponse?.totalResults)")
                print("sucess : \(newsResponse?.data)")
                for a in newsResponse?.data ?? [] {
                    print("author => \(a.author)")
                    print("description => \(a.description)")
                    print("title => \(a.title)")
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
