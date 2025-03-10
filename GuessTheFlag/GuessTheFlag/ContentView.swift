////
////  ContentView.swift
////  GuessTheFlag
////
////  Created by Antonio Caiazzo on 19/08/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var showingAlert = false
//    var body: some View {
//        //        VStack(alignment:  .leading, spacing: 20) {
//        //            Spacer()
//        //            Text("Hello World")
//        //            Text("This is another text view")
//        //            Text("Another text")
//        //            Spacer()
//        //            Spacer()
//        //            Spacer()
//        //        }
//        //
//        //        VStack(alignment: .center, spacing: 20) {
//        //            Spacer()
//        //            Text("Hello World")
//        //            Text("This is another text view")
//        //            Text("Another text")
//        //            Spacer()
//        //            Spacer()
//        //            Spacer()
//        //        }
//        //
//        //        VStack(alignment: .trailing, spacing: 20) {
//        //            Spacer()
//        //            Text("Hello World")
//        //            Text("This is another text view")
//        //            Text("Another text")
//        //            Spacer()
//        //            Spacer()
//        //            Spacer()
//        //        }
//
//        /*
//         VStack {
//         HStack {
//         ZStack {
//         Color.black
//         Text("1")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("2")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("3")
//         .foregroundStyle(.white)
//         }
//         }
//
//         HStack {
//         ZStack {
//         Color.black
//         Text("4")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("5")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("6")
//         .foregroundStyle(.white)
//         }
//         }
//
//         HStack {
//         ZStack {
//         Color.black
//         Text("7")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("8")
//         .foregroundStyle(.white)
//         }
//
//         ZStack {
//         Color.black
//         Text("9")
//         .foregroundStyle(.white)
//         }
//         }
//         }
//         */
//
//
//        //        ZStack {
//        //            Color.red
//        ////                .frame(width: 200, height: 200)
//        //                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//        //            Color(red:1, green: 0.8, blue: 0)
//        //            Text("Your content")
//        //                .background(.red)
//        //        }
//        //        .ignoresSafeArea()
//
//
//        //        ZStack {
//        //            VStack(spacing: 0) {
//        //                Color.red
//        //                Color.blue
//        //            }
//        //
//        //            Text("Your Content")
//        //                .foregroundStyle(.secondary)
//        //                .padding(50)
//        //                .background(.ultraThinMaterial)
//        //        }
//        //        .ignoresSafeArea()
//
//        //        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
//        //            .ignoresSafeArea()
//
//        //        LinearGradient(stops: [
//        //            .init(color: .white, location: 0.45),
//        //            .init(color: .black, location:  0.55),
//        //        ], startPoint: .top, endPoint: .bottom)
//        //        .ignoresSafeArea()
//
//        //        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//        //            .ignoresSafeArea()
//
//        //        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//        //            .ignoresSafeArea()
//
//        //        Text("Your content")
//        //            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//        //            .foregroundStyle(.white)
//        //            .background(.pink.gradient)
//
//        //        Button("Delete selection", role: .destructive, action: executeDelete)
//        //
//        //        VStack {
//        //            Button("Button 1") { }
//        //                .buttonStyle(.bordered)
//        //            Button("Button 2", role: .destructive) { }
//        //                .buttonStyle(.bordered)
//        //            Button("Button 3") { }
//        //                .buttonStyle(.borderedProminent)
//        //                .tint(.yellow)
//        //            Button("Button 4", role: .destructive) { }
//        //                .buttonStyle(.borderedProminent)
//        //        }
//        //
//        //        Button {
//        //            print("Button was tapped")
//        //        } label: {
//        //            Text("Tap me!")
//        //                .padding()
//        //                .foregroundStyle(.white)
//        //                .background(.red)
//        //
//        //        }
//        //
//        //        Button {
//        //            print("Edit button was tapped")
//        //        } label: {
//        //            Image(systemName: "pencil")
//        //        }
//        //
//        //        Button("Edit", systemImage: "pencil") {
//        //            print("Edit button was tapped")
//        //        }
//        //
//        //        Button {
//        //            print("Edit button was tapped")
//        //        } label: {
//        //            Label("Edit", systemImage: "pencil")
//        //                .padding()
//        //                .foregroundStyle(.white)
//        //                .background(.red)
//        //        }
//
//
//        Spacer()
//        Spacer()
//
//        Button("Show alert!") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//        }
//
//        Spacer()
//
//
//        Button("Show alert") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Ok", role: .cancel) { }
//        } message: {
//            Text("Please read this.")
//        }
//        Spacer()
//        Spacer()
//
//
//        }
//    func executeDelete() {
//        print("Now deleting...")
//    }
//}
//
//#Preview {
//    ContentView()
//}


import SwiftUI

struct FlagImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

extension View {
    func imageStyle() -> some View {
        modifier(FlagImage())
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var finishGame = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State var score = 0
    @State var questionCount = 1
    @State private var selectedTap: Int? = nil
    
    
    private let totalquestions = 8
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .imageStyle()
                        }
                        .rotation3DEffect(
                            .degrees(selectedTap == number ? 360 : 0),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .opacity(selectedTap == nil || selectedTap == number ? 1 : 0.25)
                        .scaleEffect(selectedTap == nil || selectedTap == number ? 1 : 0.75)
                        .animation(.easeInOut, value: selectedTap)
                    }
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Finish game", isPresented: $finishGame) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score is: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        
        selectedTap = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        if questionCount == totalquestions {
            finishGame = true
        } else {
            questionCount += 1
            showingScore = true
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedTap = nil
    }
    
    func reset() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        questionCount = 0
        selectedTap = nil
    }
}

#Preview {
    ContentView()
}
