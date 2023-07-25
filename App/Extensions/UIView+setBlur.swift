//
//  UIView+setBlur.swift
//  App
//
//  Created by user on 25.07.2023.
//

import UIKit

extension UIView {
    
    func setBlur() {
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blurView)
        self.sendSubviewToBack(blurView)
        self.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: widthAnchor),
            blurView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
