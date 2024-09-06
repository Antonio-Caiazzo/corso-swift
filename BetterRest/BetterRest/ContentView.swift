//
//  ContentView.swift
//  BetterRest
//
//  Created by Antonio Caiazzo on 31/08/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State private var sleepAmount = 8.0
//    @State private var wakeUp = Date.now
//
//
//    var body: some View {
//        let now = Date.now
//        let tomorrow = now.addingTimeInterval(86400)
//        let range = now...tomorrow
//
//
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//
//        DatePicker("Please enter a data", selection: $wakeUp)
//        DatePicker("", selection: $wakeUp)
//        DatePicker("Please enter a data", selection: $wakeUp)
//            .labelsHidden()
//
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//        DatePicker("Please enter a data", selection: $wakeUp, displayedComponents: .date)
//
//        DatePicker("Please enter a data", selection: $wakeUp, in: Date.now...Date.now.addingTimeInterval(86400))
//
//        Text(Date.now, format: .dateTime.hour().minute())
//        Text(Date.now, format: .dateTime.day().month().year())
//        Text(Date.now.formatted(date: .long, time: .shortened))
//    }
//
//    func exampleDates() {
////        var components = DateComponents()
////        components.hour = 8
////        components.minute = 0
////        let data = Calendar.current.date(from: components) ?? .now
////
//        let newComponents = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let newHour = newComponents.hour ?? 0
//        let newMinute = newComponents.minute ?? 0
//    }
//}
//
//#Preview {
//    ContentView()
//}

// DAY 27

//import CoreML
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var wakeUp = defaultWakeTime
//    @State private var sleepAmount = 8.0
//    @State private var coffeeAmount = 1
//    
//    @State private var alerTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
//    
//    static var defaultWakeTime: Date {
//        var components = DateComponents()
//        components.hour = 7
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? .now
//    }
//    
//    var body: some View {
//        NavigationStack{
//            Form {
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
//                    
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                }
//                
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Desidered amount of sleep")
//                        .font(.headline)
//                    
//                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//                    
//                }
//                
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                    
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
//                }
//                
//            }
//            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//            }
//            .alert(alerTitle, isPresented: $showingAlert) {
//                Button("Ok") { }
//            } message: {
//                Text(alertMessage)
//            }
//        }
//    }
//    
//    func calculateBedTime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60 * 60
//            
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//            
//            let sleepTime = wakeUp - prediction.actualSleep
//            
//            alerTitle = "Your ideal bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//        } catch {
//            alerTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
//        }
//        
//        showingAlert = true
//    }
//}
//
//#Preview {
//    ContentView()
//}


import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp, calculateBedTime)
                }
                
                Section("Desidered amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .onChange(of: sleepAmount, calculateBedTime)
                    
                }
                
                Section("How many cups of coffee") {
                    Picker("Select number of cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { number in
                            Text("\(number) \(number == 1 ? "cup" : "cups")")
                        }
                        .onChange(of: coffeeAmount, calculateBedTime)
                    }
                }
                
                Section("Your ideal bedtime is"){
                    Text(alertMessage)
                }
                
            }
            .navigationTitle("BetterRest")
            .onAppear(perform: calculateBedTime)
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60 * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
