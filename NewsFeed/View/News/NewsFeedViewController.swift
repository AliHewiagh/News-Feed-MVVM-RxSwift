//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    
    
    let newsFeedViewModel: NewsFeedViewModel
    
    init(){
       self.newsFeedViewModel = NewsFeedViewModel()
       super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
    
//        getNewsFeed
        self.newsFeedViewModel.getNewsFeed()
    }
    
    
}
