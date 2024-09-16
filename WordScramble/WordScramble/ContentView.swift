////
////  ContentView.swift
////  WordScramble
////
////  Created by Antonio Caiazzo on 09/09/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    let people = ["Finn", "Leia", "Luke", "Rey"]
//
//    var body: some View {
//
//        //        List {
//        //            Section("Section 1") {
//        //                Text("Static row 1")
//        //                Text("Static row 2")
//        //            }
//        //
//        //            Section("Section 2") {
//        //                ForEach(0..<5) {
//        //                    Text("Dynamic row \($0)")
//        //                }
//        //            }
//        //
//        //            Section("Section 3") {
//        //                Text("Static row 4")
//        //                Text("Static row 5")
//        //            }
//        //        }
//        //        .listStyle(.grouped)
//
//        //        List(0..<5) {
//        //            Text("Dynamic row \($0)")
//        //        }
//
//        //        List(people, id: \.self) {
//        //            Text($0)
//        //        }
//
//        //        List {
//        //            Text("Static Row")
//        //
//        //            ForEach(people, id: \.self) {
//        //                Text($0)
//        //            }
//        //
//        //            Text("Static Row")
//        //        }
//        Text("")
//    }
//
//    //    func testBundles() {
//    //        if let fileURL = Bundle.main.url(forResource: "risultato", withExtension: "txt") {
//    //            if let fileContents = try? String(contentsOf: fileURL) {
//    //            }
//    //        }
//    //    }
//
//    func testStrings() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ")
//
//        let input1 = """
//                        a
//                        b
//                        c
//                    """
//        let letters1 = input1.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        let word = "swift"
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        let allGood = misspelledRange.location == NSNotFound
//    }
//
//
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("Score: \(score)")
                    
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                Button("Restart") {
                    startGame()
                    usedWords.removeAll()
                    score = 0
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count >= 3 && answer != rootWord else {
            wordError(title: "Word wrong", message: "same the root or more small")
            return }
        
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        score += answer.count
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame () {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
