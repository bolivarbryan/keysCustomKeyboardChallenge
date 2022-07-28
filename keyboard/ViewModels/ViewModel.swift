//
//  ViewModel.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var fruits: [Category] = []
    
    func fetchContent(completion: @escaping  (Error?) -> Void) {
        API.fetchCategoriesContent.sendRequest { errorResponse, data in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                self.fruits = response.content.map { content in
                    return Category(name: content.displayText,
                                    subcategories: content.content.map { Subcategory(name: $0) } )
                }
                completion(nil)
            } catch {
                print(error)
                completion(error)
            }
           
        }
    }
    
}
