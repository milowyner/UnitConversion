//
//  ContentView.swift
//  UnitConversion
//
//  Created by Milo Wyner on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputLength = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var outputLength: Double {
        guard let inputLength = Double(inputLength) else { return 0 }
        let inputMeasurement = Measurement(value: inputLength, unit: units[inputUnit])
        
        return inputMeasurement.converted(to: units[outputUnit]).value
    }
    
    let units = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("Length", text: $inputLength)
                Picker("Length unit", selection: $inputUnit) {
                    ForEach(0..<units.count) {
                        Text(units[$0].symbol)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output")) {
                Text("\(outputLength)")
                Picker("Length unit", selection: $outputUnit) {
                    ForEach(0..<units.count) {
                        Text(units[$0].symbol)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
