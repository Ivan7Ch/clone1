//
//  HomeViewController.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate  {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var centeredView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let collectionMargin = CGFloat(25)
    let itemSpacing = CGFloat(18)
    var itemHeight = CGFloat(457)
    
    var itemWidth = CGFloat(0)
    var currentItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemHeight = collectionView.bounds.height
        setup()
        centeredView.backgroundColor = view.backgroundColor
        configureStackView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
        
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout
        collectionView?.decelerationRate = UIScrollView.DecelerationRate.fast
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


extension HomeViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = 3
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            let testView = InterPassport()
            testView.frame = CGRect(x: 0, y: 25, width: centeredView.bounds.width, height: centeredView.bounds.height)
            
            testView.profileImageName = "profileImage"
            testView.titleText = "Закордонний паспорт"
            testView.bdayText = "Дата народження:\n07.07.1998"
            testView.numberText = "Номер:\nFX343615"
            testView.nameText = "Чернецький\nІван\nЯрославович"
            
            cell.addSubview(testView)
        case 1:
            let testView = TaxesCode()
            testView.frame = CGRect(x: 0, y: 25, width: centeredView.bounds.width, height: centeredView.bounds.height)
            testView.nameText = "Чернецький\nІван\nЯрославович"
            testView.bdayText = "Дата народження:\n07.07.1998"
            cell.addSubview(testView)
        case 2:
            let testView = AddDocument()
            testView.frame = CGRect(x: 0, y: 25, width: centeredView.bounds.width, height: centeredView.bounds.height)
            cell.addSubview(testView)
        default:
            break
        }
        
        return cell
    }
    
    
    // MARK: - UIScrollViewDelegate protocol
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(collectionView!.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
}
