//
//  ContentView.swift
//  Ropascis
//
//  Created by Antonio Caiazzo on 28/08/24.
//


import SwiftUI

struct FormatText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.text)
            .font(.title)
    }
}

struct FormatTextLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.text)
            .font(.largeTitle.bold())
    }
}

extension View {
    func customTitleStyle() -> some View {
        modifier(FormatText())
    }
    
    func customLargeTitleStyle() -> some View {
        modifier(FormatTextLarge())
    }
}

struct ContentView: View {
    
    let mosse = ["Sasso", "Carta", "Forbice"]
    let fineGame = 10
    
    @State private var sceltaComputer = Int.random(in: 0...2)
    @State private var sceltaGiocatore = 0
    @State private var esito = Bool.random()
    @State private var round = 1
    @State private var score = 0
    @State private var showScore = false
    @State private var finishGame = false
    @State private var scoreTitle = ""
    
    
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
            VStack{
                VStack{
                    VStack{
                        Text("Il computer ha scelto:")
                            .customTitleStyle()
                        Text("\(mosse[sceltaComputer])")
                            .customLargeTitleStyle()
                    }
                    .padding()
                    
                    
                    
                    Text("Devi:")
                        .customTitleStyle()
                    Text("\(esito ? "Vincere" : "Perdere")")
                        .customLargeTitleStyle()
                    
                }
                
                HStack(spacing: 40) {
                    Button {
                        flagTapped(0)
                    } label: {
                        Text("🪨").font(.system(size: 80))
                    }
                    
                    Button {
                        flagTapped(1)
                    } label: {
                        Text("📜").font(.system(size: 80))
                    }
                    
                    Button {
                        flagTapped(2)
                    } label: {
                        Text("✂️").font(.system(size: 80))
                    }
                }
                .padding()
                .background(.button)
                .border(.text)
                .cornerRadius(10)
                
                
                Text("Score: \(score)")
                    .customLargeTitleStyle()
                Text("Round \(round) di \(fineGame)")
                    .customTitleStyle()
                    .padding()
                
                
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continua", action: otherRound)
        } message: {
            Text("Il tuo punteggio è: \(score)")
        }
        .alert("Fine gioco", isPresented: $finishGame) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Il tuo punteggio finale è \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        let winCombination = [2, 0, 1]
        let loseCombination = [1, 2, 0]
        
        sceltaGiocatore = number
        
        if esito {
            if sceltaComputer == winCombination[sceltaGiocatore] {
                score += 1
                scoreTitle = "Corretto"
            } else {
                score -= 1
                scoreTitle = "Sbagliato"
            }
            
        } else {
            if sceltaComputer == loseCombination[sceltaGiocatore] {
                score += 1
                scoreTitle = "Corretto"
            } else {
                score -= 1
                scoreTitle = "Sbagliato"
            }
            
        }
        
        if round >= fineGame {
            finishGame = true
        } else {
            round += 1
            showScore = true
        }
    }
    
    func otherRound() {
        sceltaComputer = Int.random(in: 0...2)
        esito = Bool.random()
    }
    
    func resetGame() {
        score = 0
        round = 1
        sceltaComputer = Int.random(in: 0...2)
        esito = Bool.random()
    }
}



#Preview {
    ContentView()
}
