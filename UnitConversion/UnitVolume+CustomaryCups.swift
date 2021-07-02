//
//  UnitVolume+CustomaryCups.swift
//  UnitConversion
//
//  Created by Milo Wyner on 7/2/21.
//

import Foundation

extension UnitVolume {
    static let customaryCups = UnitVolume(symbol: "cups", converter: UnitConverterLinear(coefficient: 0.236588))
}
