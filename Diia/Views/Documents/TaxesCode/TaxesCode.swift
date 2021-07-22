//
//  TaxesCode.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit

class TaxesCode: UIView {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var bdayLabel: UILabel!
    @IBOutlet private weak var codeLabel: UILabel!
    
    var nameText = "" {
        didSet {
            nameLabel.text = nameText
        }
    }
    
    var bdayText = "" {
        didSet {
            bdayLabel.text = bdayText
        }
    }
    
    var codeText = "" {
        didSet {
            codeLabel.text = codeText
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
        let bundle = Bundle.init(for: TaxesCode.self)
        if let viewsToAdd = bundle.loadNibNamed("TaxesCode", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            contentView.backgroundColor = #colorLiteral(red: 0.7529411765, green: 0.8470588235, blue: 0.9215686275, alpha: 1)
            contentView.layer.cornerRadius = 12
        }
    }
}
