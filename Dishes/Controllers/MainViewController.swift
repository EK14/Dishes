//
//  ViewController.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView: MainViewProtocol
    private let dishes = [Dish(name: "Салат 'Оливье'", protein: "30", fats: "30", carbs: "30", kcals: "47"),
                          Dish(name: "Салат 'Крабовый'", protein: "15", fats: "15", carbs: "45", kcals: "47"),
                          Dish(name: "Салат Цезарь с курицей", protein: "50", fats: "10", carbs: "30", kcals: "47")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.didLoad()
        self.navigationItem.title = "Обед"
    }
    
    init(mainView: MainViewProtocol){
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

extension MainViewController: MainViewControllerDelegate{
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
    
}
