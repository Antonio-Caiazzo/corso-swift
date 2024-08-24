//
//  ContentView.swift
//  WeSplit
//
//  Created by Antonio Caiazzo on 15/08/24.
//

/* import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Enter your name", text: $name)
                Text("Hello, \(name)")
                Section {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    ForEach(0 ..< 10) { number in
                        Text("Row \(number)")
                    }
                    
                    ForEach(0 ..< 10) {
                        Text("Row \($0)")
                    }
                }
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
*/

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    } 
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                        
                       /* ForEach(0..<101) {
                            Text($0, format: .percent)
                        } */
                    }
                    .pickerStyle(.segmented)
//                    .pickerStyle(.navigationLink)
                }
                
                Section("Amount for person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total amount") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
