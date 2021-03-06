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
        itemHeight = centeredView.bounds.height
        setup()
        centeredView.backgroundColor = view.backgroundColor
        configureStackView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadViews), name: Notification.Name("reloadViews"), object: nil)
    }
    
    @IBAction func reloadViews() {
        collectionView.reloadData()
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
        let frame = CGRect(x: 0, y: 0, width: centeredView.bounds.width, height: centeredView.bounds.height)
        
        switch indexPath.row {
        case 0:
            let testView = InterPassport()
            testView.frame = frame
            
            testView.profileImageName = "profileImage"
            testView.titleText = "Закордонний паспорт"
            testView.bdayText = Person.current.formattedBDay
            testView.numberText = "Номер:\nQS142010"
            testView.nameText = Person.current.formattedFullName
            
            cell.contentView.addSubview(testView)
        case 1:
            let testView = TaxesCode()
            testView.frame = frame
            testView.nameText = Person.current.formattedFullName
            testView.bdayText = Person.current.formattedBDay
            cell.addSubview(testView)
        case 2:
            let testView = AddDocument()
            testView.frame = frame
            cell.addSubview(testView)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        let subView = QRCodeCheck()
        subView.frame = CGRect(x: 0, y: 0, width: centeredView.bounds.width, height: centeredView.bounds.height)
        cell.addSubview(subView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: centeredView.bounds.width, height: centeredView.bounds.height)
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
