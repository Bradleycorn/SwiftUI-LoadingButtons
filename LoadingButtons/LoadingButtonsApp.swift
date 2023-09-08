//
//  LoadingButtonsApp.swift
//  LoadingButtons
//
//  Created by Brad Ball on 9/7/23.
//

import SwiftUI

@main
struct LoadingButtonsApp: App {
    @State  var defaultLoading: Bool = false
    @State  var pulsingLoading: Bool = false
    @State  var bouncingLoading: Bool = false

    var body: some Scene {
        WindowGroup {
            VStack {
                Spacer()
                LoadingButton(label: "Flashing Loading Button", isLoading: defaultLoading, action: { defaultLoading.toggle() })
                    .buttonStyle(.borderedProminent)
                Spacer()
                LoadingButton(label: "Pulsing Loading Button", type: .Pulsing, isLoading: pulsingLoading, action: { pulsingLoading.toggle() })
                    .buttonStyle(.borderedProminent)
                Spacer()
                LoadingButton(label: "Bouncing Loading Button", type: .Bouncing, isLoading: bouncingLoading, action: { bouncingLoading.toggle() })
                    .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
}
