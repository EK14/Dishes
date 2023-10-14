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
    let title = UILabel()
    let stackView = UIStackView()
    var nameTF = UITextField()
    var proteinTF = UITextField()
    var fatsTF = UITextField()
    var carbsTF = UITextField()
    var kcalTF = UITextField()
    
    private func setupBackgroundColor(){
        self.backgroundColor = .white
    }
    
    private func setupTitle(){
        title.text = "Добавьте свое блюдо"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func createTextField(placeholder: String) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x:0,y:0,width:16,height:0))
        tf.layer.cornerRadius = 16
        tf.layer.borderColor = UIColor(named: "Green")?.cgColor
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tf.heightAnchor.constraint(equalToConstant: 44)
        ])
        return tf
    }
    
    private func setupTextFields(){
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameTF = createTextField(placeholder: "Название")
        proteinTF = createTextField(placeholder: "Protein (per 100 gr.)")
        fatsTF = createTextField(placeholder: "Fats (per 100 gr.)")
        carbsTF = createTextField(placeholder: "Carbs (per 100 gr.)")
        kcalTF = createTextField(placeholder: "Kcal (per 100 gr.)")
        stackView.addArrangedSubview(nameTF)
        stackView.addArrangedSubview(proteinTF)
        stackView.addArrangedSubview(fatsTF)
        stackView.addArrangedSubview(carbsTF)
        stackView.addArrangedSubview(kcalTF)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func setupBtn(){
        let doneBtn = UIButton()
        doneBtn.backgroundColor = UIColor(named: "Green")
        doneBtn.titleLabel?.textAlignment = .center
        doneBtn.layer.cornerRadius = 22
        doneBtn.clipsToBounds = true
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Готово", for: .normal)
        doneBtn.addTarget(self, action: #selector(doneBtndidTouched), for: .touchUpInside)
        
        self.addSubview(doneBtn)
        
        NSLayoutConstraint.activate([
            doneBtn.heightAnchor.constraint(equalToConstant: 44),
            doneBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            doneBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            doneBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24)
        ])
    }
    
    private func pushAlert(){
        print("Привет")
    }
    
    @objc
    private func doneBtndidTouched(){
        guard let name = nameTF.text else {return}
        guard let protein = proteinTF.text else {return}
        guard let fats = fatsTF.text else {return}
        guard let carbs = carbsTF.text else {return}
        guard let kcal = kcalTF.text else {return}
        var dishToAdd = Dish(name: name, protein: protein, fats: fats, carbs: carbs, kcals: kcal)
        delegate?.doneBtnDidTouched(dishToAdd: dishToAdd)
    }

}

extension AddYourDishView: AddYourDishViewProtocol{
    func didLoad(){
        setupBackgroundColor()
        setupTitle()
        setupTextFields()
        setupBtn()
    }
}
