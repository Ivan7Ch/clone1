//
//  AddDocument.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit

class AddDocument: UIView {
    
    @IBOutlet weak var addButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle.init(for: AddDocument.self)
        if let viewsToAdd = bundle.loadNibNamed("AddDocument", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            contentView.backgroundColor = #colorLiteral(red: 0.7529411765, green: 0.8470588235, blue: 0.9215686275, alpha: 1)
            contentView.layer.cornerRadius = 12
            
            addButton.layer.borderWidth = 2
            addButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            addButton.layer.cornerRadius = addButton.bounds.height / 2
        }
    }
}
