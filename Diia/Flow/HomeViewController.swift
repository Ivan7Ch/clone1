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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//            self.addCellView()
//        })
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        centeredView.backgroundColor = view.backgroundColor
//        centeredView.layer.cornerRadius = 20
//        centeredView.layer.shadowRadius = 8
//        centeredView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        centeredView.layer.shadowOpacity = 0.2
//        centeredView.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    private func addCellView() {
        let testView = InterPassport()
        testView.frame = centeredView.frame
        
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


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            let testView = InterPassport()
            testView.frame = cell.bounds

            testView.profileImageName = "profileImage"
            testView.titleText = "Закордонний паспорт"
            testView.bdayText = "Дата народження:\n07.07.1998"
            testView.numberText = "Номер:\nFX343615"
            testView.nameText = "Чернецький Іван Ярославович"

            cell.addSubview(testView)
        case 1:
            let testView = TaxesCode()
            testView.frame = cell.bounds
            testView.nameText = "Чернецький\nІван\nЯрославович"
            testView.bdayText = "Дата народження:\n07.07.1998"
            cell.addSubview(testView)
        case 2:
            let testView = AddDocument()
            testView.frame = cell.bounds
            cell.addSubview(testView)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: centeredView.bounds.width, height: centeredView.bounds.height)
    }
    
}
