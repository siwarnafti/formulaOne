//
//  SplashScreen.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
        @State private var size = 0.8
        @State private var opacity = 0.5
        
        // Customise your SplashScreen here
        var body: some View {
            if isActive {
                WelcomeScreenView()
            } else {
                ZStack{
                    Color.gray
                        .ignoresSafeArea()
                    VStack {
                        VStack {
                            Image("logo")
                                .font(.system(size: 80))
                                .foregroundColor(.red)
                            Text("Formula 1 AR")
                                .font(Font.custom("Baskerville-Bold", size: 26))
                                .foregroundColor(.black.opacity(0.80))
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 0.9
                                self.opacity = 1.00
                            }
                        }
                    }}
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
