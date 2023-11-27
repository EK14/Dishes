//
//  MainView.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import UIKit

class MainView: UIView {
    
    var tableView = UITableView()
    private let addBtn = UIButton()
    var onAddBtnDidTouched: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundColor()
        setupAddButton()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundColor(){
        self.backgroundColor = .white
    }
    
    func refreshData() {
        tableView.reloadData()
    }
    
    private func setupTableView(){
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        addBtn.addTarget(self, action: #selector(addBtnDidTouched), for: .touchUpInside)
        
        self.addSubview(addBtn)
        
        NSLayoutConstraint.activate([
            addBtn.heightAnchor.constraint(equalToConstant: 44),
            addBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            addBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func addBtnDidTouched(){
        onAddBtnDidTouched?()
    }

}
