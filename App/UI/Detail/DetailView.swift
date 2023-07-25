//
//  DetailView.swift
//  App
//
//

import UIKit
import GlobalUI

class DetailView: UIView {
    
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = .systemFont(ofSize: 82, weight: .thin)
        temperatureLabel.textColor = .white
        return temperatureLabel
    }()
    
    let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .center
        dayLabel.font = .systemFont(ofSize: 29, weight: .regular)
        dayLabel.textColor = .white
        return dayLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 21, weight: .regular)
        descriptionLabel.textColor = .darkGray
        return descriptionLabel
    }()
    
    let lowHighLabel: UILabel = {
        let lowHighLabel = UILabel()
        lowHighLabel.translatesAutoresizingMaskIntoConstraints = false
        lowHighLabel.textAlignment = .center
        lowHighLabel.font = .systemFont(ofSize: 21, weight: .regular)
        lowHighLabel.textColor = .white
        return lowHighLabel
    }()
    
    let chanceRainButton = DetailButton().useConstraint
    
    let sunriseButton = DetailButton().useConstraint
    
    let sunsetButton = DetailButton().useConstraint
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = GlobalColor.backgroundColor
        
        addSubview(temperatureLabel)
        addSubview(chanceRainButton)
        addSubview(dayLabel)
        addSubview(descriptionLabel)
        addSubview(lowHighLabel)
        addSubview(sunriseButton)
        addSubview(sunsetButton)
        
        
        NSLayoutConstraint.activate([
            
            temperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            dayLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -4),
            dayLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -8),
            
            lowHighLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            lowHighLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            
            chanceRainButton.topAnchor.constraint(equalTo: lowHighLabel.bottomAnchor, constant: 104),
            chanceRainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            chanceRainButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            chanceRainButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -32),
            
            sunriseButton.topAnchor.constraint(equalTo: chanceRainButton.bottomAnchor, constant: 8),
            sunriseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sunriseButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20),
            sunriseButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20),
            
            sunsetButton.topAnchor.constraint(equalTo: chanceRainButton.bottomAnchor, constant: 8),
            sunsetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sunsetButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20),
            sunsetButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20)
        ])
        
        chanceRainButton.firstLabel.setAttributedText(text: "CHANCE RAIN", withImage: "cloud.rain")
        sunriseButton.firstLabel.setAttributedText(text: "SUNRISE", withImage: "sunrise")
        sunsetButton.firstLabel.setAttributedText(text: "SUNSET", withImage: "sunset")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
