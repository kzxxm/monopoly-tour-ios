//
//  CircularProgressIndicator.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct CircularProgressIndicator: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .foregroundStyle(Color.circularIndicatorBackground)
                .frame(width: 80, height: 80)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(lineWidth: 10)
                .foregroundStyle(Color.circularIndicator)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(Int(progress * 100))%")
                .font(.headline)
                .foregroundStyle(Color.primary)
        }
    }
}

#Preview {
    CircularProgressIndicator(progress: 0.7)
}
