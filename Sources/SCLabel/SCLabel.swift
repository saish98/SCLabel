// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SCLabelView: View {
    let buttonAction: () -> Void
    private let config: SCLabelConfiguration
    
    public init(config: SCLabelConfiguration,
                buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        self.config = config
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Text(config.displayModel.title)
                .font(config.theme.titleFont)
                .foregroundColor(config.theme.titleColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.yellow)

            Text(config.displayModel.subtitle)
                .font(config.theme.subtitleFont)
                .foregroundColor(config.theme.subtitleColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.green)

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
        .background(.red)
    }
}

#Preview {
    let mockConfiguration: SCLabelConfiguration = SCLabelConfiguration(
        displayModel: SCLabelDisplayModel(title: "Welcome to My SwiftUI View!",
                                          subtitle: "This is a reusable view from a Swift Package."),
        theme: SCLabelTheme(titleFont: .largeTitle, titleColor: .black,
                            subtitleFont: .body, subtitleColor: .brown)
    )

    SCLabelView(config: mockConfiguration, buttonAction: {})
}

public struct SCLabelConfiguration {
    let displayModel: SCLabelDisplayModel
    let theme: SCLabelTheme
    
    init(displayModel: SCLabelDisplayModel,
         theme: SCLabelTheme) {
        self.displayModel = displayModel
        self.theme = theme
    }
}

public struct SCLabelDisplayModel {
    let title: String
    let subtitle: String
    
    public init(title: String,
         subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

public struct SCLabelTheme {
    let titleFont: Font
    let titleColor: Color
    let subtitleFont: Font
    let subtitleColor: Color
    
    public init(titleFont: Font = .largeTitle,
         titleColor: Color = .black,
         subtitleFont: Font = .title2,
         subtitleColor: Color = .black) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.subtitleFont = subtitleFont
        self.subtitleColor = subtitleColor
    }
}

