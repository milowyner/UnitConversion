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
        return inputLength
    }
    
    let units = ["m", "km", "ft", "yrd", "mile"]
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("Length", text: $inputLength)
                Picker("Length unit", selection: $inputUnit) {
                    ForEach(0..<units.count) {
                        Text(units[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output")) {
                Text("\(outputLength)")
                Picker("Length unit", selection: $outputUnit) {
                    ForEach(0..<units.count) {
                        Text(units[$0])
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
