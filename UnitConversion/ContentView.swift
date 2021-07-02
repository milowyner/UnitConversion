//
//  ContentView.swift
//  UnitConversion
//
//  Created by Milo Wyner on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    @State private var unitType = 0
    
    let unitTypes = ["Length", "Volume", "Temp"]
    let lengthUnits = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    let volumeUnits = [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.customaryCups, UnitVolume.pints, UnitVolume.gallons]
    let tempUnits = [UnitTemperature.fahrenheit, UnitTemperature.celsius, UnitTemperature.kelvin]
    
    var outputValue: Double {
        let units = units
        guard let inputValue = Double(inputValue),
              inputUnit < units.count,
              outputUnit < units.count else { return 0 }
        
        let inputMeasurement = Measurement(value: inputValue, unit: units[inputUnit])
        
        return inputMeasurement.converted(to: units[outputUnit]).value
    }
    
    var units: [Dimension] {
        switch unitType {
        case 0:
            return lengthUnits
        case 1:
            return volumeUnits
        case 2:
            return tempUnits
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Unit", selection: $unitType) {
                    ForEach(0..<unitTypes.count) {
                        Text(unitTypes[$0])
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                Section(header: Text("Input")) {
                    TextField(unitTypes[unitType], text: $inputValue)
                    Picker("\(unitTypes[unitType]) selection", selection: $inputUnit) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0].symbol)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Output")) {
                    Text("\(outputValue)")
                    Picker("Length unit", selection: $outputUnit) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0].symbol)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
