//
//  AddYourDishViewController.swift
//  Dishes
//
//  Created by Элина Карапетян on 10.10.2023.
//

import UIKit

class AddYourDishViewController: UIViewController {
    
    private let addYourDishView: AddYourDishViewProtocol
    var delegate: MainViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Обед"
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        addYourDishView.didLoad()
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
    func doneBtnDidTouched(dishToAdd: Dish) {
        delegate.addDish(dish: dishToAdd)
        navigationController?.popViewController(animated: true)
    }
    
    
}
