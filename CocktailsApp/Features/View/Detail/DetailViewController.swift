//
//  DetailViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/17/24.
//

import UIKit
import SnapKit
import SDWebImage

class DetailViewController: UIViewController {
    private let backgroundImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "stackview_bg2"))
        imageView.alpha = 0.3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let cocktailImageView: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ThemeNumbers.cornerRadius.rawValue
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.headerSize.rawValue, weight: .bold)
        label.numberOfLines = .zero
        return label
    }()
    private let cocktailInstructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.titleSize.rawValue, weight: .thin)
        label.numberOfLines = .zero
        label.text = ThemeTexts.cocktailInstruction.rawValue
        return label
    }()
    private let cocktailInstruction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.subtitleSize.rawValue, weight: .ultraLight)
        label.numberOfLines = .zero
        return label
    }()
    private let cocktailsIngredient1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ThemeNumbers.subtitleSize.rawValue, weight: .light)
        return label
    }()
    //MARK: - Properties
    
    
    //MARK: - Life Cycyle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        drawDesign()
        constraints()
    }
    private func constraints(){
        backgroundImageConstraint()
        cocktailImageViewConstraint()
        cocktailNameLabelConstraint()
        cocktailInstructionLabelConstraint()
        cocktailInstructionConstraint()
        cocktailIngredient1Constraint()
    }
}
//MARK: - Draw Design
extension DetailViewController {
    private func drawDesign(){
        view.addSubview(backgroundImage)
        view.addSubview(cocktailImageView)
        view.addSubview(cocktailNameLabel)
        view.addSubview(cocktailInstructionLabel)
        view.addSubview(cocktailInstruction)
        view.addSubview(cocktailsIngredient1)
    }
}
//MARK: - Constraints
extension DetailViewController {
    private func backgroundImageConstraint(){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(cocktailImageView.snp.top)
        }
    }
    private func cocktailImageViewConstraint(){
        cocktailImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.5)
            make.width.height.equalTo(150)
        }
    }
    private func cocktailNameLabelConstraint(){
        cocktailNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cocktailImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    private func cocktailInstructionLabelConstraint(){
        cocktailInstructionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cocktailNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    private func cocktailInstructionConstraint(){
        cocktailInstruction.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cocktailInstructionLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    private func cocktailIngredient1Constraint(){
        cocktailsIngredient1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cocktailInstruction.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(20)
        }
    }
}
//MARK: - GetData
extension DetailViewController{
    func getData(model: Drink){
        cocktailNameLabel.text = model.strDrink
        cocktailInstruction.text = model.strInstructions
        cocktailImageView.sd_setImage(with: URL(string: model.strDrinkThumb!))
        cocktailsIngredient1.text = model.strIngredient1
    }
}
