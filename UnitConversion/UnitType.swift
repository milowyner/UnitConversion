//
//  UnitType.swift
//  UnitConversion
//
//  Created by Milo Wyner on 7/2/21.
//

import Foundation

enum UnitType: String, CaseIterable, Identifiable {
    case length
    case volume
    case temp
    
    var id: String { self.rawValue }
    
    var units: [Dimension] {
        switch self {
        case .length:
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
        case .volume:
            return [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.customaryCups, UnitVolume.pints, UnitVolume.gallons]
        case .temp:
            return [UnitTemperature.fahrenheit, UnitTemperature.celsius, UnitTemperature.kelvin]
        }
    }
}
