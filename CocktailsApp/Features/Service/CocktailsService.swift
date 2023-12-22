//
//  CocktailsService.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/19/23.
//

import Foundation

protocol ICocktailsService {
    func fetchByCategory(completion: @escaping([Drink]?) -> Void)
}


//MARK: - FetchByCategory
class CocktailsService: ICocktailsService {
    func fetchByCategory(completion : @escaping ([Drink]?) -> ()){
        let url = URL(string: API_URL.fetchByCategory())
        
        URLSession.shared.dataTask(with: url!) {data, response, error in
            if let expectedError = error {
                print(expectedError.localizedDescription)
                completion(nil)
            }
            
            if let safeData = data {
                let cocktails = try? JSONDecoder().decode(Drinks.self, from: safeData)
                if let cocktails = cocktails {
                    completion(cocktails.drinks)
                }
            }
        }.resume()
    }
}
