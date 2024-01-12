//
//  CocktailsViewModel.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/22/23.
//

import Foundation

protocol ICocktailsViewModel {
    var cocktailsService : ICocktailsService { get }
    var cocktailsList : [Drink]? { get set }
    var viewModelPresenter : ViewModelPresenter? { get }

    func getCategoryData()
    func setDelegate(output : ViewModelPresenter)
}

class CocktailsViewModel: ICocktailsViewModel {
    var cocktailsService: ICocktailsService
    var cocktailsList: [Drink]? = []
    var viewModelPresenter: ViewModelPresenter?

    init() {
        cocktailsService = CocktailsService()
    }
    func getCategoryData() {
        cocktailsService.fetchByCategory { [weak self] response in
            self?.cocktailsList = response ?? []
            self?.viewModelPresenter?.getCategoryData(values: self?.cocktailsList ?? [])
        }
    }
    func setDelegate(output: ViewModelPresenter) {
        viewModelPresenter = output
    }
}
