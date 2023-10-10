//
//  MainViewControllerDelegate.swift
//  Dishes
//
//  Created by Элина Карапетян on 09.10.2023.
//

import Foundation
import UIKit

protocol MainViewControllerDelegate: AnyObject, UITableViewDataSource, UITableViewDelegate{
    func addBtnDidTouched()
}
