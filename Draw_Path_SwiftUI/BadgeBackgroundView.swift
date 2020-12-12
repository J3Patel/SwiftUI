//
//  BadgeBackgroundView.swift
//  Draw_Path_SwiftUI
//
//  Created by Jatin on 12/12/20.
//

import SwiftUI

struct BadgeBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale) / 2.0)
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width*0.95 + xOffset,
                        y: height*(0.20 + HexagonParameter.adjustment)
                    )
                )
                HexagonParameter.segments.forEach { seg in
                    print("\(seg.line.x) - \(seg.line.y)")
                    
                    path.addLine(
                        to: CGPoint(
                            x: width * seg.line.x + xOffset,
                            y: height * seg.line.y)
                    )
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * seg.curve.x + xOffset,
                            y: height * seg.curve.y
                        ),
                        control: CGPoint(
                            x: width * seg.control.x + xOffset,
                            y: height*seg.control.y
                        )
                    )
                }
                
            }.fill(LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.orange]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct BadgeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackgroundView()
    }
}
