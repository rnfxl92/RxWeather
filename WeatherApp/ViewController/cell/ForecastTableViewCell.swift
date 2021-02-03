//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/29.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    static let identifier = "ForecastTableViewCell"
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        statusLabel.textColor = .white
        dateLabel.textColor = statusLabel.textColor
        timeLabel.textColor = statusLabel.textColor
        temperatureLabel.textColor = statusLabel.textColor
    }

    func configure(from data: WeatherDataType, dateFormatter: DateFormatter, tempFormatter: NumberFormatter) {
       dateFormatter.dateFormat = "M.d (E)"
       dateLabel.text = dateFormatter.string(for: data.date)
       
       dateFormatter.dateFormat = "HH:00"
       timeLabel.text = dateFormatter.string(for: data.date)
       
        if #available(iOS 13.0, *) {
            weatherImageView.image = UIImage.from(name: data.icon)
        } else {
            
        }
       
       statusLabel.text = data.description
       
       let tempStr = tempFormatter.string(for: data.temperature) ?? "-"
       temperatureLabel.text = "\(tempStr)º"
    }
}
