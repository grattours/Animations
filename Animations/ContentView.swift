//
//  ContentView.swift
//  Animations
//
//  Created by Luc Derosne on 25/10/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tappez Moi !") {
                self.isShowingRed.toggle()
                withAnimation {
                    self.isShowingRed.toggle()
                }
                
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
