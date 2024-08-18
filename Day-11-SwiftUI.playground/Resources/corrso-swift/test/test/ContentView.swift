import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<6) { index in
                    NavigationLink(destination: DetailView(itemNumber: index)) {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.yellow)
                            VStack(alignment: .leading) {
                                Text("Item \(index)")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("Description for item \(index)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Awesome App")
        }
    }
}

struct DetailView: View {
    var itemNumber: Int
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .padding()
            Text("Detail View for Item \(itemNumber)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            Text("This is a detailed description for item number \(itemNumber). Here you can provide more information about the item.")
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Item \(itemNumber)", displayMode: .inline)
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
