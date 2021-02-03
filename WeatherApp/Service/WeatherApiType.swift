//
//  WeatherApiType.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/02/03.
//

import Foundation
import CoreLocation
import RxSwift

protocol WeatherApiType {
    @discardableResult
    func fetch(location: CLLocation) -> Observable<(WeatherDataType?, [WeatherDataType])>
    
}
