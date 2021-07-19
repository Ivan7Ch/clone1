//
//  ViewController.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 19.07.2021.
//

import UIKit
import Pastel

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackground()
    }
    
    private func addBackground() {
        let pastelView = PastelView(frame: view.bounds)
        
        pastelView.startPastelPoint = .top
        pastelView.endPastelPoint = .bottom
        pastelView.animationDuration = 1.0
        
        var colors = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
        
        if self.traitCollection.userInterfaceStyle == .dark {
            colors = [#colorLiteral(red: 0.2352941176, green: 0.2549019608, blue: 0.2823529412, alpha: 1), #colorLiteral(red: 0.1058823529, green: 0.1490196078, blue: 0.1725490196, alpha: 1), #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)]
        }
        
        pastelView.setColors(colors)
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
}

