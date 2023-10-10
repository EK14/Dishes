//
//  AddYourDishViewController.swift
//  Dishes
//
//  Created by Элина Карапетян on 10.10.2023.
//

import UIKit

class AddYourDishViewController: UIViewController {
    
    private let addYourDishView: AddYourDishViewProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    init(addYourDishView: AddYourDishViewProtocol){
        self.addYourDishView = addYourDishView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = addYourDishView
    }
}

extension AddYourDishViewController: AddYourDishViewControllerDelegate{
    
}
