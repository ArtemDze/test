import SwiftUI

struct ToolCardView: View {

    let card: ToolCardModel

    private let imageAspectRatio: CGFloat = 319.0 / 129.0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Color.clear
                .aspectRatio(imageAspectRatio, contentMode: .fit)
                .overlay {
                    Image(card.previewImage)
                        .resizable()
                        .scaledToFill()
                }
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .frame(maxWidth: .infinity)

            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(card.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.black)

                    Text(card.subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(AppTheme.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 8)

                Capsule()
                    .fill(.black)
                    .frame(width: 49, height: 32)
                    .overlay {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                    }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: AppTheme.cardShadow, radius: 12, x: 0, y: 4)
    }
}

#Preview {
    ToolCardView(card: .init(
        title: "Redesign",
        subtitle: "Refresh your space with a new interior look",
        previewImage: "card_redesign",
        beforeImage: "before1",
        afterImage: "after1"
    ))
}
