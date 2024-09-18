//
//  NameSpace.swift
//  FocusState
//
//  Created by Abdallah Mahameed on 18/09/2024.
//

import SwiftUI

struct MatchedGeometryView: View {
    @Namespace private var animationNamespace
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .matchedGeometryEffect(id: "box", in: animationNamespace)
            } else {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "box", in: animationNamespace)
            }
            
            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
}
