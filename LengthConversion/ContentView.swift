//
//  ContentView.swift
//  LengthConversion
//
//  Created by MacBook Pro on 17/5/23.
//

import SwiftUI



struct ContentView: View {
    @State private var inputAmount = ""
    @State private var fromConversionIndex = 0
    @State private var toConversionIndex = 1
    @FocusState private var amountIsFocused: Bool
    
    let units: [(unitName: String, conversion: Double)] = [
        ("m", 1.0),
        ("inch", 0.0254),
        ("yard", 0.9144),
        ("foot", 0.3048),
        ("km", 1000),
        ("mile", 1_609.344)
    ]
    
    var inputValue: Double {
        return Double(inputAmount) ?? 0
    }
    
    var unitAmount: Double {
        let unit = units[fromConversionIndex]
        return inputValue * unit.conversion
    }
    
    var convertedAmount: Double {
        let unit = units[toConversionIndex]
        return unitAmount / unit.conversion
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", text: $inputAmount)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("from", selection: $fromConversionIndex) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0].unitName)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert from")
                }
                
                Section {
                    Picker("To", selection: $toConversionIndex) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0].unitName)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }

                Section {
                    Text(convertedAmount, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
