//
//  API.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import Foundation

enum API: String {
    case fetchCategoriesContent
}

extension API {
    var host: String {
      return "https://frontend-coding-challenge-api.herokuapp.com/"
    }
    
    var method: String {
        switch self {
        case .fetchCategoriesContent: return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchCategoriesContent: return "getContent"
        }
    }
    
    func sendRequest(completion: @escaping (Error?, Data?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig,
                                 delegate: nil,
                                 delegateQueue: nil)
        guard let URL = URL(string: host + path) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = method

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            completion(error, data)
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
