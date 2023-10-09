//
//  MainViewControllerAssembly.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import Foundation

struct MainViewControllerAssembly{
    func create() -> MainViewController{
        let mainView = MainView()
        
        let controller = MainViewController(mainView: mainView)
        
        mainView.delegate = controller
        
        return controller
    }
}
