//
//  DetailButton.swift
//  App
//
//  Created by user on 23.07.2023.
//

import UIKit

class DetailButton: UIButton {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    let firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.textColor = .darkGray
        firstLabel.font = .systemFont(ofSize: 14, weight: .medium)
        return firstLabel
    }()
    
    let secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.textColor = .white
        secondLabel.font = .systemFont(ofSize: 48, weight: .light)
        return secondLabel
    }()
    
    let thirdLabel: UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.textColor = .white
        thirdLabel.font = .systemFont(ofSize: 16, weight: .light)
        thirdLabel.numberOfLines = 0
        return thirdLabel
        
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        clipsToBounds = true
        setBlur()
        
        addSubview(stackView)
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)
        stackView.setCustomSpacing(40, after: secondLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
