//
//  Badge.swift
//  Draw_Path_SwiftUI
//
//  Created by Jatin on 12/12/20.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8.0

    var badgeSymbols: some View {
        ForEach(0..<Int(Self.rotationCount)) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0, padding: -70)
                .opacity(0.5)
        }
            
        
    }
    
    var body: some View {
        ZStack {
            BadgeBackgroundView()
            
            GeometryReader { geo in
                badgeSymbols
                    .scaleEffect(1.0/4.0, anchor: .top)
                    .position(
                        x: geo.size.width / 2,
                        y: (3.0/4.0) * geo.size.height)
            }
            
        }.scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
