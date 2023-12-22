//
//  HomeViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/18/23.
//

import UIKit
import SnapKit

protocol ViewModelPresenter {
    func getData(values: [Drink?])
}

class HomeViewController: UIViewController {
    //MARK: - UI Elements
    private let categoryTableView: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    //MARK: - Properties
    private lazy var cocktailsList : [Drink?] = []
    var viewModel : ICocktailsViewModel = CocktailsViewModel()
    
    //MARK: - Life Cycyle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Functions
    private func configure(){
        drawDesign()
        constraints()
        viewModel.setDelegate(output: self)
        viewModel.getData()
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Identifier.cellIdentifier.rawValue)
    }
    
    private func constraints(){
        tableViewConstraint()
    }
}

//MARK: - drawDesign
extension HomeViewController {
    private func drawDesign(){
        view.backgroundColor = .purple
        view.addSubview(categoryTableView)
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
}

//MARK: - constraints
extension HomeViewController {
    private func tableViewConstraint(){
        categoryTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - TableViewDataSource & TableViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCocktail = cocktailsList[indexPath.row]
        guard let cell : CategoryTableViewCell = categoryTableView.dequeueReusableCell(withIdentifier: Identifier.cellIdentifier.rawValue) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.saveData(model: currentCocktail!)
        return cell
    }
}


//MARK: - getData
extension HomeViewController: ViewModelPresenter {
    func getData(values: [Drink?]) {
        cocktailsList = values
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
}
