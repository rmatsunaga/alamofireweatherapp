//
//  Weather.swift
//  WeatherApp
//
//  Created by Rey Matsunaga on 2/26/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

import Foundation
import Alamofire

struct Fuck: Decodable {
    var currently: Weather
}

struct Weather: Decodable {
    var summary: String?
    var icon: String?
    var temperature: Double?
    
}
