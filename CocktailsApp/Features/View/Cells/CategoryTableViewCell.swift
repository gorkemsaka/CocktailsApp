//
//  CategoryTableViewCell.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 12/21/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    private let cocktailsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ConstantsNumbers.cornerRadius.rawValue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsNumbers.labelSize.rawValue, weight: .bold)
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
            make.top.equalTo(10)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(130)
        }
    }
    private func titleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(cocktailsImageView.snp.bottom).offset(5)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
    }
}

//MARK: - saveData
extension CategoryTableViewCell {
    func saveData(model : Drink) {
        titleLabel.text = model.strDrink
    }
}
