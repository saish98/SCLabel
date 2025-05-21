// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SCLabelView: View {
    let buttonAction: () -> Void
    
    public init(buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        VStack {
            Text("Welcome to My SwiftUI View!")
                .font(.largeTitle)
                .padding()

            Text("This is a reusable view from a Swift Package.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()

            Button(action: {
                buttonAction()
            }) {
                Text("Tap Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
