//
//  RotatedBadgeSymbol.swift
//  Draw_Path_SwiftUI
//
//  Created by Jatin on 12/12/20.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    let padding: CGFloat
    var body: some View {
        BadgeSymbol()
            .padding(padding)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 10), padding: 0).background(Color.red)
    }
}
