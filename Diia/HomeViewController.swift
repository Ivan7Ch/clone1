//
//  HomeViewController.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var centeredView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.addCellView()
        })
        
        centeredView.backgroundColor = .clear
    }
    
    private func addCellView() {
        let testView = CellView()
        testView.frame = centeredView.frame// CGRect(x: 28, y: 200, width: UIScreen.main.bounds.width - 56, height: 470)
        //358x470
        
        testView.profileImageName = "profileImage"
        testView.titleText = "Закордонний паспорт"
        testView.bdayText = "Дата народження:\n07.07.1998"
        testView.numberText = "Номер:\nFX343615"
        testView.nameText = "Чернецький Іван Ярославович"
        
        view.addSubview(testView)
    }
    
    private func configureStackView() {
        let items = [("house", "Документи"), ("star.square", "Послуги"), ("bell", "Повідомлення"), ("line.horizontal.3", "Меню")]
        
        for item in items {
            stackView.addArrangedSubview(generateTabBarItem(item.0, text: item.1))
        }
    }
    
    private func generateTabBarItem(_ imageName: String, text: String) -> UIView {
        
        let tabBarItem = TabBarItem()
        tabBarItem.frame = CGRect(x: 100, y: 100, width: 80, height: 50)
        tabBarItem.imageName = imageName
        tabBarItem.text = text
        return tabBarItem
    }
    
}



