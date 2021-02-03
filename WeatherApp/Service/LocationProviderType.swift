//
//  LocationProviderType.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/02/03.
//

import Foundation
import CoreLocation
import RxSwift

protocol LocationProviderType {
    @discardableResult
    func currentLocation() -> Observable<CLLocation>
    
    @discardableResult
    func currentAddress() -> Observable<String>
}
