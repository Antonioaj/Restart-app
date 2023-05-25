//
//  HomeView.swift
//  Restart app
//
//  Created by Antonio Ajewole on 22/05/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Header
            Spacer()

            ZStack {
                CirclularView(color: .gray, opacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                        .easeInOut(duration: 4)
                        .repeatForever(),
                    value: isAnimating)
            }

            // MARK: - Center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.system(.title3, weight: .light))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            // MARK: - Footer
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(.title3, design: .rounded, weight: .bold))
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
