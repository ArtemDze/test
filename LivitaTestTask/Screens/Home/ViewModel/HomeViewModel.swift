import Combine
import Foundation

final class HomeViewModel: ObservableObject {

    @Published var cards: [ToolCardModel] = [
        .init(
            title: "Redesign",
            subtitle: "Refresh your space with a new interior look",
            previewImage: "card_redesign",
            beforeImage: "before1",
            afterImage: "after1"
        ),
        .init(
            title: "Sketch to Render",
            subtitle: "Refresh your space with a new interior look",
            previewImage: "card_sketch",
            beforeImage: "before2",
            afterImage: "after2"
        ),
        .init(
            title: "Furniture Replace",
            subtitle: "Refresh your space with a new interior look",
            previewImage: "card_furniture",
            beforeImage: "before3",
            afterImage: "after3"
        )
    ]
}
