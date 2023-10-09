//
//  MainView.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import UIKit

protocol MainViewProtocol: UIView{
    func didLoad()
}

class MainView: UIView {
    
    weak var delegate: MainViewControllerDelegate?
    private var tableView = UITableView()
    private let addBtn = UIButton()
    
    private func setupBackgroundColor(){
        self.backgroundColor = .white
    }
    
    private func setupTableView(){
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = delegate
        
        tableView.delegate = delegate
        
        tableView.register(DishCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: addBtn.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupAddButton() {
        addBtn.backgroundColor = UIColor(named: "Green")
        addBtn.titleLabel?.textAlignment = .center
        addBtn.layer.cornerRadius = 22
        addBtn.clipsToBounds = true
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle("Добавить блюдо", for: .normal)
        
        self.addSubview(addBtn)
        
        NSLayoutConstraint.activate([
            addBtn.heightAnchor.constraint(equalToConstant: 44),
            addBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            addBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension MainView: MainViewProtocol{
    func didLoad(){
        setupBackgroundColor()
        setupAddButton()
        setupTableView()
    }
}
