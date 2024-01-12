//
//  SearchViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/10/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    //MARK: - UI Elements
    private let searchTableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = ThemeNumbers.tableViewRowHeight.rawValue
        return tableView
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    //MARK: - Properties
    
    
    //MARK: - Life Cycyle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure(){
        drawDesign()
        setupSearchController()
        constraints()
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: Identifier.searchCellIdentifier.rawValue)
    }
}
extension SearchViewController {
    private func drawDesign(){
        view.backgroundColor = .white
        view.addSubview(searchTableView)
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
}
//MARK: - Search Controller Functions
extension SearchViewController: UISearchResultsUpdating{
    private func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = ThemeTexts.searchBarPlaceHolder.rawValue
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}
//MARK: - Setup TableView
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SearchTableViewCell = searchTableView.dequeueReusableCell(withIdentifier: Identifier.searchCellIdentifier.rawValue) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.getSearchData()
        return cell
    }
}
//MARK: - Constraints
extension SearchViewController {
    private func constraints(){
        searchTableViewConstraint()
    }
    private func searchTableViewConstraint(){
        searchTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
