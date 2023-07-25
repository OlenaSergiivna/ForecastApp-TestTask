//
//  UILable+setAttributedText.swift
//  App
//
//  Created by user on 25.07.2023.
//

import UIKit

extension UILabel {
    
    func setAttributedText(text: String, withImage imageName: String, color: UIColor = .darkGray) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: imageName)?.withTintColor(color)
        let fullString = NSMutableAttributedString(attachment: imageAttachment)
        let textAtt = NSAttributedString(string: " \(text)")
        fullString.append(textAtt)
        self.attributedText = fullString
    }
}
