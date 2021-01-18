//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    
    private var newsFeedViewModel: NewsFeedViewModel?
//    let newsFeedViewModel: NewsFeedViewModel
    
    init(){
        self.newsFeedViewModel = NewsFeedViewModel()
        self.newsFeedViewModel?.setDependencies(provider: NewsAPI())
 
       super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
    
//    viewModel.setDependencies(provider: WeatherProvider())
//            currentVC.viewModel = viewModel
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        
    print("dddd")
//        getNewsFeed
        
        self.newsFeedViewModel?.getNewsFeed()
    }
    
    
}
