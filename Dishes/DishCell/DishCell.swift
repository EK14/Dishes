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
    private let favBtn = UIButton()
    private var btnState = false
    private let proteinHSV = UIStackView()
    private let fatsHSV = UIStackView()
    private let carbsHSV = UIStackView()
    private let proteinImg = UIImageView()
    private let fatsImg = UIImageView()
    private let carbsImg = UIImageView()
    private let proteinAmount = UILabel()
    private let fatsAmount = UILabel()
    private let carbsAmount = UILabel()
    private let name = UILabel()
    private let dishKcal = UILabel()
    
    
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
        proteinHSV.axis = .horizontal
        proteinHSV.spacing = 5
        fatsHSV.axis = .horizontal
        fatsHSV.spacing = 5
        carbsHSV.axis = .horizontal
        carbsHSV.spacing = 5
        
        proteinHSV.translatesAutoresizingMaskIntoConstraints = false
        fatsHSV.translatesAutoresizingMaskIntoConstraints = false
        proteinHSV.translatesAutoresizingMaskIntoConstraints = false
        
        proteinImg.image = UIImage(named: "protein")
        fatsImg.image = UIImage(named: "fats")
        carbsImg.image = UIImage(named: "carbs")
        
        proteinAmount.text = protein
        proteinAmount.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        fatsAmount.text = fats
        fatsAmount.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        name.numberOfLines = 1
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = title
        name.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        dishVSV.axis = .vertical
        dishVSV.distribution = .fill
        dishVSV.alignment = .leading
        dishVSV.addArrangedSubview(name)
        dishVSV.addArrangedSubview(microelemHSV)
    }
    
    private func setupKcalAndFavHSV(kcal: String){
        dishKcal.text = kcal + " kcal"
        dishKcal.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        dishKcal.textAlignment = .center
        favBtn.setImage(UIImage(systemName: "star"), for: .normal)
        favBtn.tintColor = UIColor(named: "Green")
        favBtn.addTarget(self, action: #selector(addBtndidTouched), for: .touchUpInside)
        
        kcalAndFavHSV.axis = .horizontal
        kcalAndFavHSV.spacing = 5
        kcalAndFavHSV.distribution = .equalCentering
        kcalAndFavHSV.addArrangedSubview(dishKcal)
        kcalAndFavHSV.addArrangedSubview(favBtn)
    }
    
    @objc
    private func addBtndidTouched(){
        if btnState{
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        else{
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
        }
        btnState.toggle()
    }
}
