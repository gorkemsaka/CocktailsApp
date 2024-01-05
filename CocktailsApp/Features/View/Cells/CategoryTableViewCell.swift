//
//  CategoryTableViewCell.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/21/23.
//

import UIKit
import SDWebImage

class CategoryTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    private let cocktailsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ConstantsNumbers.cornerRadius.rawValue
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsNumbers.subtitleSize.rawValue, weight: .bold)
        label.numberOfLines = .zero
        return label
    }()
    
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycyle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func configure(){
        drawDesing()
        constraints()
    }
    private func constraints(){
        cocktailsImageViewConstraints()
        titleLabelConstraints()
    }
    
}

//MARK: - drawDesign & constraints
extension CategoryTableViewCell {
    private func drawDesing(){
        addSubview(cocktailsImageView)
        addSubview(titleLabel)
    }
    
    private func cocktailsImageViewConstraints(){
        cocktailsImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    private func titleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cocktailsImageView)
            make.leading.equalTo(cocktailsImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}

//MARK: - saveData
extension CategoryTableViewCell {
    func saveData(model : Drink) {
        titleLabel.text = model.strDrink
        cocktailsImageView.sd_setImage(with: URL(string: model.strDrinkThumb!))
    }
}

