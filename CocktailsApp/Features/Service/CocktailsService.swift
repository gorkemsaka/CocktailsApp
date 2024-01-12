//
//  CocktailsService.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/19/23.
//

import Foundation

protocol ICocktailsService {
    func fetchByCategory(completion: @escaping([Drink]?) -> Void)
    func fetchByFirstLetter(completion: @escaping([Drink]?) -> Void)
}



class CocktailsService: ICocktailsService {
    //MARK: - FetchByCategory
    func fetchByCategory(completion: @escaping ([Drink]?) -> ()){
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
    //MARK: - FetchByFirstLetter
    func fetchByFirstLetter(completion: @escaping ([Drink]?) -> Void) {
        let url = URL(string: API_URL.fetchByFirstLetter())
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let expectedError = error {
                print(expectedError.localizedDescription)
                completion(nil)
            }
            if let safedata = data {
                let cocktails = try? JSONDecoder().decode(Drinks.self, from: safedata)
                if let cocktails = cocktails {
                    completion(cocktails.drinks)
                }
            }
        }.resume()
    }
}
