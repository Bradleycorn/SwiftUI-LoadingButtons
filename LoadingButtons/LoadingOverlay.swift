//
//  LoadingButton.swift
//  LoadingButtons
//
//  Created by Brad Ball on 9/8/23.
//

import SwiftUI

struct LoadingOverlay: ViewModifier {
    let isLoading: Bool
    let type: DotType
    
    func body(content: Content) -> some View {
        content
            .opacity(isLoading ? 0 : 1)
            .overlay(alignment: .center) {
                if (isLoading) {
                    LoadingIndicator(type)
                } else {
                    EmptyView()
                }
            }
    }
}

extension View {
    func lodingOverlay(type: DotType = .Flashing, isLoading: Bool) -> some View {
        modifier(LoadingOverlay(isLoading: isLoading, type: type))
    }
}


struct LoadingOverlay_Previews: PreviewProvider {
    struct Content: View {
        @State var isLoading = false
        
        var body: some View {
            VStack {
                Text("Click Me")
                    .onTapGesture {
                        isLoading.toggle()
                    }
                    .lodingOverlay(isLoading: isLoading)
            }
        }
    }
    
    static var previews: some View {
        Content()
    }
}
