//
//  StyleGuideGradient.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 09/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import UIKit

class StyleGuide {
    static func getGradientButton(viewToApply: UIView) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        
        let color1 = UIColor(red: 134.00/255.0, green: 102.0/255.0, blue: 254.0/255.0, alpha: 1.0)
        let color2 = UIColor(red: 6.0/255.0, green: 220.0/255.0, blue: 214.0/255.0, alpha: 1.0)
        
        gradient.frame = CGRect(x: viewToApply.bounds.origin.x, y: viewToApply.bounds.origin.y, width: viewToApply.bounds.size.width, height: viewToApply.bounds.size.height)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradient
    }
}
