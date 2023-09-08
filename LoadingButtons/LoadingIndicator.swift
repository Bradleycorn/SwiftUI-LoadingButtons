//
//  LoadingIndicator.swift
//  LoadingButtons
//
//  Created by Brad Ball on 9/8/23.
//

import SwiftUI

fileprivate let DEFAULT_DOT_SIZE: CGFloat = 12

struct LoadingIndicator: View {
    private let numberOfDots = 3
    private let indicatorType: DotType
    private let dotSize: CGFloat
    private let dotColor: any ShapeStyle
    
    init(_ type: DotType = .Flashing, dotSize: CGFloat = DEFAULT_DOT_SIZE, dotFillColor: any ShapeStyle = ForegroundStyle.foreground) {
        self.indicatorType = type
        self.dotSize = dotSize
        self.dotColor = dotFillColor
    }
    
    var body: some View {
        AnimatedDots(numberOfDots: numberOfDots, type: indicatorType, size: dotSize)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            LoadingIndicator(.Flashing, dotSize: 12)
            Spacer()
            LoadingIndicator(.Pulsing, dotSize: 20)
                .foregroundColor(.blue)
            Spacer()
            LoadingIndicator(.Bouncing, dotSize: 12)
                .foregroundColor(.red)
            Spacer()
        }
    }
}
