//
//  ViewController.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView: MainView?
    private var dishes = [Dish(name: "Салат 'Оливье'", protein: "30", fats: "30", carbs: "30", kcals: "47"),
                          Dish(name: "Салат 'Крабовый'", protein: "15", fats: "15", carbs: "45", kcals: "47"),
                          Dish(name: "Салат Цезарь с курицей", protein: "50", fats: "10", carbs: "30", kcals: "47")]
    private let addYourDishVC = AddYourDishViewControllerAssembly().create()

    override func viewDidLoad() {
        super.viewDidLoad()
        addYourDishVC.delegate = self
        mainView?.tableView.dataSource = self
        mainView?.tableView.delegate = self
        self.navigationItem.title = "Обед"
        mainView?.onAddBtnDidTouched = {[weak self] in self?.addBtnDidTouched()}
    }
    
    init(mainView: MainView){
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
}

extension MainViewController: AddYourDishViewControllerDelegate, UITableViewDelegate, UITableViewDataSource{
    func doneBtnDidTouched(dishToAdd: Dish) {
        dishes.append(dishToAdd)
        mainView?.refreshData()
        navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DishCell
        cell.setupCell(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    
    func addBtnDidTouched() {
        navigationController?.pushViewController(addYourDishVC, animated: true)
    }
}
