//
//  FirstLetterViewModel.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/15/24.
//

import Foundation

protocol IByNameViewModel {
    var cocktailsService: ICocktailsService { get }
    var cocktailsList: [Drink]? { get set}
    var viewModelPresenter : ByNameViewModelPresenter? { get }
    
    func getByName(cocktailName: String)
    func setDelegate(output: ByNameViewModelPresenter)
}
class ByNameViewModel : IByNameViewModel {
    //MARK: - Properties
    var cocktailsService: ICocktailsService
    var cocktailsList: [Drink]? = []
    var viewModelPresenter: ByNameViewModelPresenter?
    
    //MARK: - Life Cycle
    init(){
        cocktailsService = CocktailsService()
    }
    //MARK: - Functions
    func getByName(cocktailName: String) {
        cocktailsService.fetchByName(cocktailName: cocktailName) { [weak self] response in
            self?.cocktailsList = response ?? []
            self?.viewModelPresenter?.getData(values: self?.cocktailsList ?? [])
        }
    }
    func setDelegate(output: ByNameViewModelPresenter) {
        viewModelPresenter = output
    }
}
