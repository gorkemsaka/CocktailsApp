//
//  CocktailsModel.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/19/23.
//

import Foundation

// MARK: - Drinks
struct Drinks: Codable {
    let drinks: [Drink]?
}

// MARK: - Drink
struct Drink: Codable {
    let strDrink: String?
    let strDrinkThumb: String?
    let idDrink: String?
}
