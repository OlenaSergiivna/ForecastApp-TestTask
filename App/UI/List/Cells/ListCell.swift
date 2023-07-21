//
//  ListCell.swift
//  App
//
//

import GlobalUI
import UIKit

class ListCell: UITableViewCell {

    private let label = UILabel.useConstraint
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configure()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(label)
    }

    func configure() {
        label.textColor = .white
        contentView.backgroundColor = GlobalColor.backgroundColor
    }
    
    func configureData(with item: ForecastItem) {
        
        let weatherDescription = item.description
        label.text = "Day \(item.day). \(weatherDescription)"
        
        switch weatherDescription {
        case "Sunny":
            label.text? += " ☀️"
        case "Rain":
            label.text? += " ☂️"
        case "Windy":
            label.text? += " 💨"
        case "Lightning":
            label.text? += " ⚡️"
        case "Overcast":
            label.text? += " ☁️"
        case "Showers":
            label.text? += " ☔️"
        default:
            return
        }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
