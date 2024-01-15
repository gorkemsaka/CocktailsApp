//
//  FirstLetterViewModel.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/15/24.
//

import Foundation

protocol IFirstLetterViewModel {
    var cocktailsService: ICocktailsService { get }
    var cocktailsList: [Drink]? { get set}
    var viewModelPresenter : FirstLetterViewModelPresenter? { get }
    
    func getFirstLetterData(letter: String)
    func setDelegate(output: FirstLetterViewModelPresenter)
}
class FirstLetterViewModel : IFirstLetterViewModel {
    //MARK: - Properties
    var cocktailsService: ICocktailsService
    var cocktailsList: [Drink]? = []
    var viewModelPresenter: FirstLetterViewModelPresenter?
    
    //MARK: - Life Cycle
    init(){
        cocktailsService = CocktailsService()
    }
    //MARK: - Functions
    func getFirstLetterData(letter: String) {
        cocktailsService.fetchByFirstLetter(letter: letter) { [weak self] response in
            self?.cocktailsList = response ?? []
            self?.viewModelPresenter?.getData(values: self?.cocktailsList ?? [])
        }
    }
    func setDelegate(output: FirstLetterViewModelPresenter) {
        viewModelPresenter = output
    }
}
