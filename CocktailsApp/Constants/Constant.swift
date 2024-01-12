//
//  Constant.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/19/23.
//

import Foundation

enum API_URL : String {
    case BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1"
    case categoryAPI_KEY = "/filter.php?c=Cocktail"
    //don't forget this call needed a search letter
    case firstLetterAPI_KEY = "/search.php?f="
    
    static func fetchByCategory() -> String {
        return "\(BASE_URL.rawValue)\(categoryAPI_KEY.rawValue)"
    }
    
    static func fetchByFirstLetter() -> String {
        return "\(BASE_URL.rawValue)\(firstLetterAPI_KEY.rawValue)"
    }
}

enum ConstantsNumbers : CGFloat {
    //MARK: - Corner Radius
    case cornerRadius = 15
    
    //MARK: - Label Sizes
    case headerSize = 50
    case subtitleSize = 17
}

enum Identifier : String {
    case cellIdentifier = "CategoryTableViewCell"
}

enum AppTexts : String {
    case appTitle = "COCKTAILS"
    case appSubTitle = "Cocktails are unique drinks where taste turns into art, telling a different story with every sip. They fascinate everyone with the colors, aromas and textures they contain."
}
