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
    private let backgroundImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "stackview_bg2"))
        imageView.alpha = 0.7
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let appTitle: UILabel = {
        var label = UILabel()
        label.text = ThemeTexts.appTitle.rawValue
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.headerSize.rawValue, weight: .bold)
        label.numberOfLines = .zero
        return label
    }()
    private let appSubTitle: UILabel = {
        var label = UILabel()
        label.text = ThemeTexts.appSubTitle.rawValue
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.subtitleSize.rawValue, weight: .thin)
        label.numberOfLines = .zero
        return label
    }()
    private let categoryTableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = ThemeNumbers.tableViewRowHeight.rawValue
        return tableView
    }()
    //MARK: - Properties
    private lazy var cocktailsList : [Drink?] = []
    var viewModel : ICocktailsViewModel = CocktailsViewModel()
    var detailVC: DetailViewController = DetailViewController()
    
    //MARK: - Life Cycyle
    override func viewDidLoad(){
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure(){
        drawDesign()
        constraints()
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Identifier.categoryCellIdentifier.rawValue)
        viewModel.setDelegate(output: self)
        viewModel.getData()
    }
    private func constraints(){
        backgroundImageConstraint()
        appTitleConstraint()
        appSubTitleConstraint()
        tableViewConstraint()
    }
}
//MARK: - drawDesign
extension HomeViewController {
    private func drawDesign(){
        view.addSubview(backgroundImage)
        view.addSubview(appTitle)
        view.addSubview(appSubTitle)
        view.addSubview(categoryTableView)
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
}
//MARK: - Constraints
extension HomeViewController {
    private func backgroundImageConstraint(){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    private func appTitleConstraint(){
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    private func appSubTitleConstraint(){
        appSubTitle.snp.makeConstraints { make in
            make.top.equalTo(appTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    private func tableViewConstraint(){
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(appSubTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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
        guard let cell : CategoryTableViewCell = categoryTableView.dequeueReusableCell(withIdentifier: Identifier.categoryCellIdentifier.rawValue) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.saveData(model: currentCocktail!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCocktail = cocktailsList[indexPath.row]
        detailVC.getData(model: currentCocktail!)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - getData
extension HomeViewController: ViewModelPresenter {
    func getData(values: [Drink?]) {
        cocktailsList = values
        DispatchQueue.main.async{
            self.categoryTableView.reloadData()
        }
    }
}

