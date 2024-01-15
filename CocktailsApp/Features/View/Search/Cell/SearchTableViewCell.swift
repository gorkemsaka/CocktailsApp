//
//  SearchTableViewCell.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/12/24.
//

import UIKit
import SnapKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {
    //MARK: - UI Elements
    private var cocktailsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ThemeNumbers.cornerRadius.rawValue
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.subtitleSize.rawValue, weight: .bold)
        label.numberOfLines = .zero
        return label
    }()
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Functions
    private func configure(){
        drawDesign()
        constraints()
    }
}

//MARK: - drawDesign
extension SearchTableViewCell {
    private func drawDesign(){
        addSubview(cocktailsImageView)
        addSubview(titleLabel)
    }
}

//MARK: - Constraints
extension SearchTableViewCell {
    private func constraints(){
        cocktailsImageViewConstraint()
        titleLabelConstraint()
    }
    private func cocktailsImageViewConstraint(){
        cocktailsImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    private func titleLabelConstraint(){
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cocktailsImageView)
            make.leading.equalTo(cocktailsImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}

//MARK: - Dummie Data
extension SearchTableViewCell {
    func getData(model: Drink){
        titleLabel.text = model.strDrink
        cocktailsImageView.sd_setImage(with: URL(string: model.strDrinkThumb!))
    }
}
