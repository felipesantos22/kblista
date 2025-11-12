//
//  SplashView.swift
//  Calendary
//
//  Created by Felipe Santos on 10/11/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var logoOpacity = 0.0
    @State private var textOpacity = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.colorOne, .colorTwo],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image(systemName: "calendar")
                    .font(.system(size: 90))
                    .foregroundColor(.black)
                    .opacity(logoOpacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.0)) {
                            logoOpacity = 1.0
                        }
                    }
                
                Text("KB Agenda")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .opacity(textOpacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2).delay(0.5)) {
                            textOpacity = 1.0
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashView()
}
