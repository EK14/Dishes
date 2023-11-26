//
//  AddYourDishViewControllerAssembly.swift
//  Dishes
//
//  Created by Элина Карапетян on 10.10.2023.
//

import Foundation

struct AddYourDishViewControllerAssembly{
    func create() -> AddYourDishViewController{
        let addYourDishView = AddYourDishView()
        
        let controller = AddYourDishViewController(addYourDishView: addYourDishView)
        
        return controller
    }
}
