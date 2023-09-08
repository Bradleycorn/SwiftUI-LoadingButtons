//
//  ContentView.swift
//  LoadingButtons
//
//  Created by Brad Ball on 9/7/23.
//

import SwiftUI


fileprivate let SINGLE_DOT_DURATION: CGFloat = 0.15

enum DotType {
    case Pulsing
    case Flashing
    case Bouncing
}

struct AnimatedDots: View {
    
    private let numberOfDots: Int
    private let dotType: DotType
    private let dotSize: CGFloat
    private let totalDuration: CGFloat

    init(numberOfDots: Int, type: DotType, size: CGFloat) {
        self.numberOfDots = numberOfDots
        self.dotType = type
        self.dotSize = size
        self.totalDuration = SINGLE_DOT_DURATION * CGFloat(integerLiteral: numberOfDots)
    }
    
    var body: some View {
        
        HStack {
            ForEach(0..<numberOfDots, id: \.self) { index in
                Dot(type: dotType, size: dotSize, animationDuration: totalDuration, animationDelay: SINGLE_DOT_DURATION * CGFloat(integerLiteral: index))
            }
        }
    }
}

fileprivate struct Dot: View {
    let type: DotType
    let size: CGFloat
    let animationDuration: CGFloat
    let animationDelay: CGFloat
    
    var body: some View {
        switch (type) {
        case .Pulsing:
            PulsingDot(size: size, duration: animationDuration, delay: animationDelay)
        case .Flashing:
            FlashingDot(size: size, duration: animationDuration, delay: animationDelay)
        case .Bouncing:
            BouncingDot(size: size, duration: animationDuration, delay: animationDelay)
        }
    }
}

fileprivate extension Animation {
    static func dotAnimation(duration: CGFloat, delay: CGFloat) -> Animation {
        return Animation.timingCurve(1, 0, 0.98, 0.94, duration: duration).repeatForever().delay(delay)
    }
}


fileprivate struct FlashingDot: View {
    private let minOpacity: CGFloat = 0.25
    private let maxOpacity: CGFloat = 1

    private let size: CGFloat
    private let duration: CGFloat
    private let delay: CGFloat

    @State private var opacity: CGFloat
    
    init(size: CGFloat, duration: CGFloat, delay: CGFloat) {
        self.size = size
        self.duration = duration
        self.delay = delay
        self.opacity = minOpacity
    }
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .opacity(opacity)
            .animation(Animation.dotAnimation(duration: duration, delay: delay), value: opacity)
            .onAppear { opacity = maxOpacity }
    }
}

fileprivate struct PulsingDot: View {
    private let minScale: CGFloat = 0.0
    private let maxScale: CGFloat = 1.0

    private let size: CGFloat
    private let duration: CGFloat
    private let delay: CGFloat

    @State private var scale: CGFloat
    
    init(size: CGFloat, duration: CGFloat, delay: CGFloat) {
        self.size = size
        self.duration = duration
        self.delay = delay
        self.scale = minScale
    }
    
    var body: some View {
        FlashingDot(size: size, duration: duration, delay: delay)
            .scaleEffect(scale)
            .animation(Animation.dotAnimation(duration: duration, delay: delay), value: scale)
            .onAppear { scale = maxScale }
    }
}


fileprivate struct BouncingDot: View {
    private let minOffset: CGFloat
    private let maxOffset: CGFloat

    private let size: CGFloat
    private let duration: CGFloat
    private let delay: CGFloat

    @State private var offset: CGFloat
    
    init(size: CGFloat, duration: CGFloat, delay: CGFloat) {
        self.size = size
        self.duration = duration
        self.delay = delay

        self.maxOffset = size / CGFloat(integerLiteral: 2)
        self.minOffset = maxOffset * CGFloat(integerLiteral: -1)

        self.offset = minOffset
    }
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .offset(x: 0, y: offset)
            .animation(Animation.dotAnimation(duration: duration, delay: delay), value: offset)
            .onAppear { offset = maxOffset }
    }
}

struct AnimatedDots_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            AnimatedDots(numberOfDots: 4, type: .Flashing, size: 20)
                .foregroundColor(.indigo)
            Spacer()
            AnimatedDots(numberOfDots: 5, type: .Pulsing, size: 30)
                .foregroundColor(.green)
            Spacer()
            AnimatedDots(numberOfDots: 6, type: .Bouncing, size: 40)
                .foregroundColor(.accentColor)
            Spacer()
        }
    }
}
