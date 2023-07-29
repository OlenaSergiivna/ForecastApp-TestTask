//
//  ListCell.swift
//  App
//
//

import GlobalUI
import UIKit

class ListCell: UITableViewCell {
    
    let backView: UIImageView = {
        let backView = UIImageView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.setBlur()
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 20
        return backView
    }()
    
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .systemFont(ofSize: 21, weight: .medium)
        dayLabel.textColor = .white
        return dayLabel
    }()
    
    private let descriptionSymbolLabel: UILabel = {
        let descriptionSymbolLabel = UILabel()
        descriptionSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionSymbolLabel.textAlignment = .left
        descriptionSymbolLabel.font = .systemFont(ofSize: 18, weight: .medium)
        descriptionSymbolLabel.textColor = .white
        return descriptionSymbolLabel
    }()
    
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 2
        return descriptionLabel
    }()
    
    private let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .left
        temperatureLabel.font = .systemFont(ofSize: 40, weight: .light)
        temperatureLabel.textColor = .white
        return temperatureLabel
    }()
    
    private let lowHighLabel: UILabel = {
        let lowHighLabel = UILabel()
        lowHighLabel.translatesAutoresizingMaskIntoConstraints = false
        lowHighLabel.textAlignment = .left
        lowHighLabel.font = .systemFont(ofSize: 14, weight: .medium)
        lowHighLabel.textColor = .white
        return lowHighLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(backView)
        backView.addSubview(dayLabel)
        backView.addSubview(descriptionSymbolLabel)
        backView.addSubview(descriptionLabel)
        backView.addSubview(temperatureLabel)
        backView.addSubview(lowHighLabel)
    }
    
    func configureUI() {
        self.backgroundColor = GlobalColor.backgroundColor
        selectionStyle = .none
    }
    
    func configure(with item: ForecastItem) {
        
        dayLabel.text = "Day \(item.day)"
        lowHighLabel.text = "L:\(item.low)° H:\(item.high)°"
        
        let averageTemperature = (item.low + item.high) / 2
        temperatureLabel.text = "\(averageTemperature)°C"
        
        let weatherDescription = item.description
        descriptionLabel.text = weatherDescription
        
        switch weatherDescription {
        case "Sunny":
            descriptionSymbolLabel.text = "☀️"
        case "Rain":
            descriptionSymbolLabel.text = "☂️"
        case "Windy":
            descriptionSymbolLabel.text = "💨"
        case "Lightning":
            descriptionSymbolLabel.text = "⚡️"
        case "Overcast":
            descriptionSymbolLabel.text = "☁️"
        case "Showers":
            descriptionSymbolLabel.text = "☔️"
        case "Cloudy":
            descriptionSymbolLabel.text = "🌤️"
        default:
            return
        }
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dayLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            dayLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            dayLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionSymbolLabel.topAnchor, constant: -8),
            
            descriptionSymbolLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            descriptionSymbolLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            
            temperatureLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            temperatureLabel.topAnchor.constraint(equalTo: dayLabel.topAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: lowHighLabel.topAnchor, constant: -16),
            
            lowHighLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
            lowHighLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }
}
