//
//  SearchViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/10/24.
//

import UIKit
import SnapKit

protocol ByNameViewModelPresenter {
    func getData(values: [Drink?])
}
class SearchViewController: UIViewController {
    //MARK: - UI Elements
    private let searchTableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = ThemeNumbers.tableViewRowHeight.rawValue
        return tableView
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    //MARK: - Properties
    private lazy var cocktailsList: [Drink?] = []
    var viewModel: IByNameViewModel = ByNameViewModel()
    var detailVC: DetailViewController = DetailViewController()
    
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
        viewModel.setDelegate(output: self)
        viewModel.getByName(cocktailName: "")
    }
}
//MARK: - drawDesign
extension SearchViewController {
    private func drawDesign(){
        view.backgroundColor = .white
        view.addSubview(searchTableView)
        searchTableView.delegate = self
        searchTableView.dataSource = self
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
        if let searchText = searchController.searchBar.text?.lowercased() {
             viewModel.getByName(cocktailName: searchText)
         }
    }
}
//MARK: - Setup TableView
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCocktail = cocktailsList[indexPath.row]
        guard let cell: SearchTableViewCell = searchTableView.dequeueReusableCell(withIdentifier: Identifier.searchCellIdentifier.rawValue) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.getData(model: currentCocktail!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCocktail = cocktailsList[indexPath.row]
        detailVC.getData(model: currentCocktail!)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - Fetch Data From ViewModel
extension SearchViewController: ByNameViewModelPresenter {
    func getData(values: [Drink?]) {
        cocktailsList = values
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}
