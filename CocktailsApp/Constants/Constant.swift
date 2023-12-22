//
//  Constant.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/19/23.
//

import Foundation

enum API_URL : String {
    case BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1"
    case API_KEY = "/filter.php?c=Cocktail"
    
    static func fetchByCategory() -> String {
        return "\(BASE_URL.rawValue)\(API_KEY.rawValue)"
    }
}

enum ConstantsNumbers : CGFloat {
    //MARK: - Corner Radius
    case cornerRadius = 5
    
    //MARK: - Label Size's
    case labelSize = 17
}

enum Identifier : String {
    case cellIdentifier = "CategoryTableViewCell"
}
