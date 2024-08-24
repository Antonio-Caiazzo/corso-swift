//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Antonio Caiazzo on 24/08/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//
//            Text("Hello, world!")
//                .padding()
//                .background(.red)
//                .padding()
//                .background(.blue)
//                .padding()
//                .background(.green)
//                .padding()
//                .background(.yellow)
//
//            Button("Hello World") {
//                print(type(of: self.body))
//            }
//            .frame(width: 200, height: 200)
//            .background(.red)
//        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//        .background(.cyan)
//    }
//}
//
//#Preview {
//    ContentView()
//}


//import SwiftUI
//
//struct ContentView: View {
//    @State private var useRedText = false
//
//    var body: some View {
//        Button("Hello world") {
//            useRedText.toggle()
//        }
//        .buttonStyle(.bordered)
//        .foregroundStyle(useRedText ? .red : .blue)
//    }
//}
//
//#Preview {
//    ContentView()
//}

//import SwiftUI
//
//struct ContentView: View {
//    @State private var useRedText = false
//
//    var body: some View {
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//                .blur(radius: 0)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
//        .blur(radius: 5)
//    }
//}
//
//#Preview {
//    ContentView()
//}

//import SwiftUI
//
//struct ContentView: View {
//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("nunquam titillandus")
//
//    var body: some View {
//        VStack {
//            motto1
//            motto2
//
//            motto1
//                .foregroundStyle(.red)
//            motto2
//                .foregroundStyle(.blue)
//
//            spells
//        }
//    }
//}
//
//@ViewBuilder var spells: some View {
//    Text("Lumos")
//    Text("Obliviate")
//}
//
//#Preview {
//    ContentView()
//}


//import SwiftUI
//
//struct CapsuleText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .background(.blue)
//            .clipShape(.capsule)
//    }
//}
//
//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundStyle(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(.rect(cornerRadius: 10))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundStyle(.white)
//                .padding(5)
//                .background(.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}
//
//struct ContentView: View {
//
//    var body: some View {
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//                .foregroundStyle(.white)
//            CapsuleText(text: "Second")
//                .foregroundStyle(.yellow)
//            Text("Hello World")
//                .modifier(Title())
//
//            Text("New Hello")
//                .titleStyle()
//
//        }
//
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermarked(with: "Hacking with Swift")
//        Button("new"){
//
//        }
//        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
//        .background(.yellow)
//        .watermarked(with: "pippo")
//    }
//}
//
//
//#Preview {
//    ContentView()
//}


import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack{
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View{
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
        
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

#Preview {
    ContentView()
}
