//
//  MapPin.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct MapPin: View {
    @ObservedObject var location: Location
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(height: 80)
                    .shadow(radius: 4)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundStyle(location.colorSetId.color)
            }
            
            Image(systemName: location.visited ? "checkmark.circle" : "circle")
                .contentTransition(.symbolEffect(.replace))
                .font(.system(size: 32))
                .offset(y: 10)
                .foregroundStyle(location.visited ? Color.visited : Color.notVisited)
        }
        .frame(width: 50)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    let location = LocationRepository(storage: LocationStorage()).getLocation(by: .oldKentRoad)!
    
    ZStack {
        Color.appBackground
        MapPin(location: location)
    }
}
