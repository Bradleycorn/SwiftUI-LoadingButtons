//
//  LoadingButton.swift
//  LoadingButtons
//
//  Created by Brad Ball on 9/8/23.
//

import SwiftUI

struct LoadingButton: View {
    private let label: String
    private let type: DotType
    private let isLoading: Bool
    private let action: ()->Void
    
    init(label: String, type: DotType = .Flashing, isLoading: Bool, action: @escaping () -> Void) {
        self.label = label
        self.type = type
        self.isLoading = isLoading
        self.action = action
    }

    var body: some View {
        Button(action: { action() }) {
            Text(label)
                .lodingOverlay(type: type, isLoading: isLoading)
        }
    }
}

struct LoadingButton_Previews: PreviewProvider {

    struct Content: View {
        @State  var defaultLoading: Bool = false
        @State  var pulsingLoading: Bool = false
        @State  var bouncingLoading: Bool = false
        
        var body: some View {
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
    
    static var previews: some View {
        Content()
    }
}
