//
//  DishCell.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import UIKit

class DishCell: UITableViewCell {
    
    private let horizontalSV = UIStackView()
    private let microelemHSV = UIStackView()
    private let dishVSV = UIStackView()
    private let kcalAndFavHSV = UIStackView()
    
    func setupCell(dish: Dish){
        setupHSV()
        setupMicroelemHSV(protein: dish.protein, fats: dish.fats, carbs: dish.carbs)
        setupDishVSV(title: dish.name)
        setupKcalAndFavHSV(kcal: dish.kcals)
    }
    
    private func setupHSV(){
        horizontalSV.addArrangedSubview(dishVSV)
        horizontalSV.addArrangedSubview(kcalAndFavHSV)
        horizontalSV.axis = .horizontal
        horizontalSV.distribution = .equalSpacing
        horizontalSV.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(horizontalSV)
        NSLayoutConstraint.activate([
            horizontalSV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            horizontalSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            horizontalSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontalSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupMicroelemHSV(protein: String, fats: String, carbs: String){
        let proteinHSV = UIStackView()
        let fatsHSV = UIStackView()
        let carbsHSV = UIStackView()
        
        proteinHSV.axis = .horizontal
        proteinHSV.spacing = 5
        fatsHSV.axis = .horizontal
        fatsHSV.spacing = 5
        carbsHSV.axis = .horizontal
        carbsHSV.spacing = 5
        
        proteinHSV.translatesAutoresizingMaskIntoConstraints = false
        fatsHSV.translatesAutoresizingMaskIntoConstraints = false
        proteinHSV.translatesAutoresizingMaskIntoConstraints = false
        
        let proteinImg = UIImageView()
        proteinImg.image = UIImage(named: "protein")
        let fatsImg = UIImageView()
        fatsImg.image = UIImage(named: "fats")
        let carbsImg = UIImageView()
        carbsImg.image = UIImage(named: "carbs")
        
        let proteinAmount = UILabel()
        proteinAmount.text = protein
        proteinAmount.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let fatsAmount = UILabel()
        fatsAmount.text = fats
        fatsAmount.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let carbsAmount = UILabel()
        carbsAmount.text = carbs
        carbsAmount.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        proteinHSV.addArrangedSubview(proteinImg)
        proteinHSV.addArrangedSubview(proteinAmount)
        fatsHSV.addArrangedSubview(fatsImg)
        fatsHSV.addArrangedSubview(fatsAmount)
        carbsHSV.addArrangedSubview(carbsImg)
        carbsHSV.addArrangedSubview(carbsAmount)
        
        microelemHSV.axis = .horizontal
        microelemHSV.spacing = 10
        microelemHSV.distribution = .equalCentering
        microelemHSV.translatesAutoresizingMaskIntoConstraints = false
        microelemHSV.translatesAutoresizingMaskIntoConstraints = false
        microelemHSV.addArrangedSubview(proteinHSV)
        microelemHSV.addArrangedSubview(fatsHSV)
        microelemHSV.addArrangedSubview(carbsHSV)
    }
    
    private func setupDishVSV(title: String){
        let name = UILabel()
        name.numberOfLines = 1
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = title
        name.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        dishVSV.axis = .vertical
        dishVSV.distribution = .fill
        dishVSV.alignment = .leading
        dishVSV.addArrangedSubview(name)
        dishVSV.addArrangedSubview(microelemHSV)
    }
    
    private func setupKcalAndFavHSV(kcal: String){
        let dishKcal = UILabel()
        dishKcal.text = kcal + " kcal"
        dishKcal.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        dishKcal.textAlignment = .center
        let favBtn = UIButton()
        favBtn.setImage(UIImage(systemName: "star"), for: .normal)
        favBtn.tintColor = UIColor(named: "Green")
        
        kcalAndFavHSV.axis = .horizontal
        kcalAndFavHSV.spacing = 5
        kcalAndFavHSV.distribution = .equalCentering
        kcalAndFavHSV.addArrangedSubview(dishKcal)
        kcalAndFavHSV.addArrangedSubview(favBtn)
    }
}
