//
//  AddYourDishView.swift
//  Dishes
//
//  Created by Элина Карапетян on 10.10.2023.
//

import UIKit

protocol AddYourDishViewProtocol: UIView{
    func didLoad()
}

class AddYourDishView: UIView {

    weak var delegate: AddYourDishViewControllerDelegate?

}

extension AddYourDishView: AddYourDishViewProtocol{
    func didLoad(){
        
    }
}
