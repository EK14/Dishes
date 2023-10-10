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
    
    func setupCell(dish: Dish){
        setupHSV()
        setupTitle(title: dish.name)
    }
    
    private func setupHSV(){
        horizontalSV.axis = .horizontal
        horizontalSV.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(horizontalSV)
        NSLayoutConstraint.activate([
            horizontalSV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            horizontalSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupTitle(title: String){
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = title
        horizontalSV.addSubview(name)
    }
}
