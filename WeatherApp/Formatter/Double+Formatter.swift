//
//  Double+Formatter.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/30.
//

import Foundation


fileprivate let temperatureFormmater: MeasurementFormatter = {
   let f = MeasurementFormatter()
    f.locale = Locale(identifier: "ko_kr")
    f.numberFormatter.maximumFractionDigits = 1
    f.unitOptions = .temperatureWithoutUnit
    return f
}()

extension Double {
    var temperatureString: String {
        let temp = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return temperatureFormmater.string(from: temp)
    }
}
