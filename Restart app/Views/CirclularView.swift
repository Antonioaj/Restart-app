//
//  CirclularView.swift
//  Restart app
//
//  Created by Antonio Ajewole on 22/05/2023.
//

import SwiftUI

struct CirclularView: View {
    let color: Color
    let opacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(opacity),
                        lineWidth: 40)
                .frame(width: 260, height: 260)
            
            Circle()
                .stroke(color.opacity(opacity),
                        lineWidth: 80)
                .frame(width: 260, height: 260)
            
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CirclularView_Previews: PreviewProvider {
    static var previews: some View {
        CirclularView(color: .black, opacity: 0.1)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")

        CirclularView(color: .white, opacity: 0.2)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
