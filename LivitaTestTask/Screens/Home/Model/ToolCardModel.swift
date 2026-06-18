import Foundation

struct ToolCardModel: Identifiable {
    let id = UUID()

    let title: String
    let subtitle: String
    let previewImage: String
    let beforeImage: String
    let afterImage: String
}
