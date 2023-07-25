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
        contentView.temperatureLabel.text = viewModel.formattedTemperature()
        contentView.dayLabel.text = "Day \(viewModel.forecastItem.day)"
        contentView.descriptionLabel.text = viewModel.forecastItem.description
        contentView.lowHighLabel.text = "L:\(viewModel.forecastItem.low)° H:\(viewModel.forecastItem.high)°"
        
        contentView.chanceRainButton.secondLabel.text = viewModel.formattedChanceOfRain()
        contentView.chanceRainButton.thirdLabel.text = viewModel.chanceOfRainDescription()
        
        contentView.sunriseButton.secondLabel.text = viewModel.formattedSunriseTime()
        contentView.sunriseButton.thirdLabel.text = viewModel.sunriseDescription()
        
        contentView.sunsetButton.secondLabel.text = viewModel.formattedSunsetTime()
        contentView.sunsetButton.thirdLabel.text = viewModel.sunsetDescription()
    }
}
