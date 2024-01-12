//
//  SearchViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/10/24.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - UI Elements
    private let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycyle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure(){
        view.backgroundColor = .white
        setupSearchController()
    }
}
//MARK: - Search Controller Functions
extension SearchViewController: UISearchResultsUpdating{
    private func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}
