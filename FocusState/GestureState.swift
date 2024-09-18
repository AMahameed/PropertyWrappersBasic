//
//  GestureState.swift
//  FocusState
//
//  Created by Abdallah Mahameed on 18/09/2024.
//

import SwiftUI

struct DraggableCircle: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                    }
            )
    }
}

#Preview {
    DraggableCircle()
}
