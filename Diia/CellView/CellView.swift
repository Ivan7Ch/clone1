//
//  CellView.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit

class CellView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var bdayLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var signatureImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var profileImageName = "" {
        didSet {
            profileImageView.image = UIImage(named: profileImageName)
        }
    }
    
    var titleText = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var bdayText = "" {
        didSet {
            bdayLabel.text = bdayText
        }
    }
    
    var numberText = "" {
        didSet {
            numberLabel.text = numberText
        }
    }
    
    var nameText = "" {
        didSet {
            nameLabel.text = nameText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle.init(for: CellView.self)
        if let viewsToAdd = bundle.loadNibNamed("CellView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            contentView.backgroundColor = #colorLiteral(red: 0.7529411765, green: 0.8470588235, blue: 0.9215686275, alpha: 1)
            contentView.layer.cornerRadius = 12
            profileImageView.layer.borderWidth = 2
            profileImageView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.6150577052)
        }
    }
}
