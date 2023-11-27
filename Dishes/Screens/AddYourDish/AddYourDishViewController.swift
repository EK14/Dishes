//
//  AddYourDishViewController.swift
//  Dishes
//
//  Created by Элина Карапетян on 10.10.2023.
//

import UIKit

class AddYourDishViewController: UIViewController{
    
    private let addYourDishView: AddYourDishView?
    var delegate: AddYourDishViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Обед"
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        addYourDishView?.onDoneButtonDidTouched = {[weak self] in self?.doneBtndidTouched()}
    }
    
    init(addYourDishView: AddYourDishView){
        self.addYourDishView = addYourDishView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = addYourDishView
    }
    
    @objc
    private func doneBtndidTouched(){
        guard let name = addYourDishView?.nameTF.text else {return}
        guard let protein = addYourDishView?.proteinTF.text else {return}
        guard let fats = addYourDishView?.fatsTF.text else {return}
        guard let carbs = addYourDishView?.carbsTF.text else {return}
        guard let kcal = addYourDishView?.kcalTF.text else {return}
        let dishToAdd = Dish(name: name, protein: protein, fats: fats, carbs: carbs, kcals: kcal)
        delegate?.doneBtnDidTouched(dishToAdd: dishToAdd)
    }
}


