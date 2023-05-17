//
//  ContentView.swift
//  LengthConversion
//
//  Created by MacBook Pro on 17/5/23.
//

import SwiftUI



struct ContentView: View {
    @State private var convertFrom = 0.0
    @FocusState private var valueIsFocused: Bool
    var unitsInput = ["km", "mi", "ft", "yd", "m"]
    var unitsOutput = ["km", "mi", "ft", "yd", "m"]
    @State private var selectedUnit = "km"
    @State private var selectOuputUnit = "mi"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $convertFrom, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    Picker("unit", selection: $selectedUnit) {
                        ForEach(unitsInput, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert from")
                }
                
                Section {
                    Picker("unit", selection: $selectOuputUnit) {
                        ForEach(unitsOutput, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
            }
            .navigationTitle("Convertions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
