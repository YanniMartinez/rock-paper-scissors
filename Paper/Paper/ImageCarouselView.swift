//
//  ImageCarouselView.swift
//  Paper
//
//  Created by MacBook 26 on 24/05/23.
//

import SwiftUI


struct ImageCarouselView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var currentIndex = 0
    @Binding var isAnimating : Bool
    @Binding var currentAppChoice : Int

     var body: some View {
         VStack {
             Image(isAnimating ? moves[currentIndex] : moves[currentAppChoice])
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 200, height: 200)
                 .animation(.easeInOut(duration: 0.5))
                 .onAppear(perform: startAnimation)
             
            
         }
         .onChange(of: isAnimating) { newValue in
             if newValue {
                 startAnimation()
             }
         }
     }
     
     private func startAnimation() {
         currentIndex = 0
         
         Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
             currentIndex = (currentIndex + 1) % moves.count
             if !isAnimating {
                 timer.invalidate()
             }
         }
     }
 }
