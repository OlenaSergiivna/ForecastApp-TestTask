//
//  DetailViewController.swift
//  App
//
//

import UIKit
import Combine
import GlobalUI

class DetailViewController: UIViewController {
    
    private var viewModel: DetailViewModel
    
    let contentView = DetailView.useConstraint

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(contentView)
        setupConstraints()
        setupData()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupData() {
        contentView.temperatureLabel.text = "\((viewModel.forecastItem.low + viewModel.forecastItem.high)/2)°C"
        contentView.dayLabel.text = "Day \(viewModel.forecastItem.day)"
        contentView.descriptionLabel.text = viewModel.forecastItem.description
        contentView.lowHighLabel.text = "L:\(viewModel.forecastItem.low)° H:\(viewModel.forecastItem.high)°"
        
        contentView.chanceRainButton.firstLabel.text = "Chance rain".uppercased()
        let chanceRain = Int(viewModel.forecastItem.chanceRain * 100)
        contentView.chanceRainButton.secondLabel.text = "\(chanceRain)%"
        
        switch chanceRain {
        case 0:
            contentView.chanceRainButton.thirdLabel.text = "Chance rain is zero today."
        case 1...49:
            contentView.chanceRainButton.thirdLabel.text = "Chance rain is low today."
        case 50:
            contentView.chanceRainButton.thirdLabel.text = "Chance rain is 50/50 today."
        case 51...79:
            contentView.chanceRainButton.thirdLabel.text = "Chance rain is high today."
        case 80...100:
            contentView.chanceRainButton.thirdLabel.text = "Chance rain is very high today."
        default:
            return
        }
        
        contentView.sunriseButton.firstLabel.text = "Sunrise".uppercased()
        let sunriseHours = viewModel.forecastItem.sunrise / 3600
        let sunriseMinutes = (viewModel.forecastItem.sunrise % 3600) / 60
        let sunriseTime = "\(sunriseHours):\(sunriseMinutes)"
        contentView.sunriseButton.secondLabel.text = "\(sunriseTime)"
        
        switch sunriseHours {
        case 3...4:
            contentView.sunriseButton.thirdLabel.text = "Welcome the early morning sunrise today."
        case 5...6:
            contentView.sunriseButton.thirdLabel.text = "Welcome the morning sun."
        case 7...8:
            contentView.sunriseButton.thirdLabel.text = "Welcome the late morning sun today."
        default:
            return
        }
        
        contentView.sunsetButton.firstLabel.text = "Sunset".uppercased()
        let sunsetHours = viewModel.forecastItem.sunset / 3600
        let sunsetMinutes = (viewModel.forecastItem.sunset % 3600) / 60
        let sunsetTime = "\(sunsetHours):\(sunsetMinutes)"
        contentView.sunsetButton.secondLabel.text = "\(sunsetTime)"
        
        switch sunsetHours {
        case 15...17:
            contentView.sunsetButton.thirdLabel.text = "Early sunset today, enjoy the evening."
        case 18...19:
            contentView.sunsetButton.thirdLabel.text = "Welcome the evening sunset."
        case 20...21:
            contentView.sunsetButton.thirdLabel.text = "Late sunset today, make the most of the day."
        default:
            return
        }
    }
}


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
