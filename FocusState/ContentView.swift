//
//  ContentView.swift
//  FocusState
//
//  Created by Abdallah Mahameed on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    enum Field {
        case username, password
    }

    @State private var username = ""
    @State private var password = ""
    @State private var isDraggbleCirclePresented = false
    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .focused($focusedField, equals: .username)  // Bind focus to username
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .focused($focusedField, equals: .password)  // Bind focus to password
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Log In") {
                    if username.isEmpty {
                        focusedField = .username  // Programmatically set focus
                    } else if password.isEmpty {
                        focusedField = .password
                    } else {
                        isDraggbleCirclePresented = true
                    }
                }
                .navigationDestination(isPresented: $isDraggbleCirclePresented) {
                    DraggableCircle()
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
