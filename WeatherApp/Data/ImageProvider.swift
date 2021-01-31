//
//  ImageProvider.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/30.
//

import UIKit

class ImageProvider {
    static let shard = ImageProvider()
    
    private init() { }
    
    func weatherImage(named: String) -> UIImage? {
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(named)@2x.png") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            print(error)
            return nil
        }
    }
}
