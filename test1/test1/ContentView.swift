//
//  ContentView.swift
//  GymApp
//
//  Created by Antonio Caiazzo on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                Spacer()
                DashboardView()
                Spacer()
                FooterView()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("GymApp")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "gearshape.fill")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                DashboardItem(iconName: "figure.walk", title: "Workouts")
                DashboardItem(iconName: "heart.fill", title: "Health")
            }
            HStack {
                DashboardItem(iconName: "chart.bar.fill", title: "Progress")
                DashboardItem(iconName: "calendar", title: "Schedule")
            }
        }
        .padding()
    }
}

struct DashboardItem: View {
    var iconName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct FooterView: View {
    var body: some View {
        HStack {
            NavigationButton(iconName: "house.fill", label: "Home")
            Spacer()
            NavigationButton(iconName: "magnifyingglass", label: "Search")
            Spacer()
            NavigationButton(iconName: "person.fill", label: "Profile")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct NavigationButton: View {
    var iconName: String
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(.white)
            Text(label)
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
