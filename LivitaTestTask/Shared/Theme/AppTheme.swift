import SwiftUI

enum AppTheme {

    static let background = Color(red: 0.949, green: 0.949, blue: 0.969)
    static let secondaryText = Color(red: 0.557, green: 0.557, blue: 0.576)
    static let tabInactive = Color(red: 0.557, green: 0.557, blue: 0.576)

    static let proGradient = LinearGradient(
        colors: [
            Color(hex: "#FE9448"),
            Color(hex: "#B57BFF"),
            Color(hex: "#6981FF")
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    static let cardShadow = Color.black.opacity(0.06)
    static let tabBarShadow = Color.black.opacity(0.08)
}
