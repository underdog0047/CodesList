//
//  FavoritesScreen.swift
//  codesList
//
//  Created by Briant Garza on 10/29/21.
//

import UIKit


class FavoritesScreen: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBackgroundColor()
        
        
    }
    
    
    
    
    
    
    
    private func initBackgroundColor() {
        // Used to change the background gradient color
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            UIColor(red: 49/255, green: 192/255, blue: 191/255, alpha: 1).cgColor,
            UIColor(red: 156/255, green: 237/255, blue: 233/255, alpha: 1).cgColor,
            UIColor(red: 221/255, green: 220/255, blue: 175/255, alpha: 1).cgColor
        ]
        
        gradientLayer.shouldRasterize = true
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}
