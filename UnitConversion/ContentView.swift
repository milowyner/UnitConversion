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
    @State private var unitType: UnitType = .length
    
    var units: [Dimension] { unitType.units }
    
    var outputValue: Double {
        guard let inputValue = Double(inputValue),
              inputUnit < units.count,
              outputUnit < units.count else { return 0 }
        
        let inputMeasurement = Measurement(value: inputValue, unit: units[inputUnit])
        
        return inputMeasurement.converted(to: units[outputUnit]).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Unit", selection: $unitType) {
                    ForEach(UnitType.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("Input")) {
                    TextField(unitType.rawValue.capitalized, text: $inputValue)
                    Picker(unitType.rawValue, selection: $inputUnit) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0].symbol)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Output")) {
                    Text("\(outputValue)")
                    Picker(unitType.rawValue, selection: $outputUnit) {
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
