//
//  ContentView.swift
//  LenghtConvert
//
//  Created by Antonio Caiazzo on 18/08/24.
//

import SwiftUI

struct ContentView: View {
    
    let mesaure = ["metri", "km", "piedi", "iarde", "miglie"]
    
    @State private var mesaureInput: String = "metri"
    @State private var mesaureOutput: String = "metri"
    @State private var numberOfConvert = 0.0
    @FocusState private var numberIsFocused: Bool
    
    var numberConverted: Double {
        var ConvertInMetres: Double {
            switch mesaureInput {
            case "km":
                return numberOfConvert * 1000
            case "piedi":
                return numberOfConvert * 0.3048
            case "iarde":
                return numberOfConvert * 0.9144
            case "miglie":
                return numberOfConvert * 1609.34
            default:
                return numberOfConvert
            }
        }
        
        switch mesaureOutput {
        case "km":
            return ConvertInMetres * 0.001
        case "piedi":
            return ConvertInMetres * 3.28084
        case "iarde":
            return ConvertInMetres * 1.09361
        case "miglie":
            return ConvertInMetres * 0.000621371
        default:
            return ConvertInMetres
        }
    }
        
    var body: some View {
        NavigationStack {
            Form {
                Section("Inserisci l'unita di misura") {
                    
                    TextField("Inserisci un numero", value: $numberOfConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                    
                    Picker("Seleziona l'unità di misura", selection: $mesaureInput) {
                        ForEach(mesaure, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Inserisci in che unità convertire"){
                    Picker("Seleziona l'unità di misura", selection: $mesaureOutput) {
                        ForEach(mesaure, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Il valore convertito è: \(numberConverted.formatted(.number))")

                }
                
            }
            .navigationTitle("LenghtConvert")
            .toolbar {
                if numberIsFocused {
                    Button("Fatto") {
                        numberIsFocused = false
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
