//
//  Protocols.swift
//  NewsFeed
//
//  Created by Ali Hewiagh on 09/11/2020.
//

import Foundation


protocol Repository {
  
  associatedtype T
  
  func getAll() -> [T]
  func get( identifier:Int ) -> T?
  func create( a:T ) -> Bool
  func update( a:T ) -> Bool
  func delete( a:T ) -> Bool
  
}



enum RequestError: Error {
    case unknownError
    case connectionError
    case operationNotAllowed
    case invalidRequest
    case invalidResponse
    case serverError
    case serverUnavailable
    case userDisabled
    case wrongPassword
    case invalidEmail
    case userNotFound
}
