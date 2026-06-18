import SwiftUI

struct BeforeAfterSlider: View {

    let beforeImage: String
    let afterImage: String

    @State private var sliderFraction: CGFloat = 0.5

    private let imageAspectRatio: CGFloat = 357.0 / 470.0

    private let handleSize: CGFloat = 42
    private let dividerWidth: CGFloat = 2
    private let cornerRadius: CGFloat = 32

    var body: some View {
        GeometryReader { geo in

            let size = geo.size
            let dividerX = size.width * sliderFraction

            ZStack {

                // MARK: - After image layer
                imageLayer(afterImage, size: size)
                    .overlay {
                        comparisonLabel("After")
                            .padding(12)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topTrailing
                            )
                            .opacity(afterLabelOpacity)
                    }


                // MARK: - Before image layer
                ZStack {

                    imageLayer(beforeImage, size: size)

                    comparisonLabel("Before")
                        .padding(12)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                        .opacity(beforeLabelOpacity)
                }
                .mask(alignment: .leading) {
                    Rectangle()
                        .frame(width: dividerX)
                }


                // MARK: - Divider line
                Rectangle()
                    .fill(.white)
                    .frame(
                        width: dividerWidth,
                        height: size.height
                    )
                    .position(
                        x: dividerX,
                        y: size.height / 2
                    )


                // MARK: - Slider handle
                Circle()
                    .fill(.white)
                    .frame(
                        width: handleSize,
                        height: handleSize
                    )
                    .shadow(
                        color: .black.opacity(0.18),
                        radius: 8,
                        y: 3
                    )
                    .overlay {

                        HStack(spacing: 0) {

                            Image(systemName: "chevron.left")
                            Image(systemName: "chevron.right")

                        }
                        .font(
                            .system(
                                size: 12,
                                weight: .bold
                            )
                        )
                        .foregroundStyle(.black.opacity(0.8))
                    }
                    .position(
                        x: dividerX,
                        y: size.height / 2
                    )
            }
            .frame(
                width: size.width,
                height: size.height
            )
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in

                        let position = min(
                            max(value.location.x, 0),
                            size.width
                        )

                        withAnimation(.interactiveSpring(
                            response: 0.25,
                            dampingFraction: 1
                        )) {
                            sliderFraction = position / size.width
                        }
                    }
            )
        }
        .aspectRatio(
            imageAspectRatio,
            contentMode: .fit
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
            .stroke(
                Color.black.opacity(0.08),
                lineWidth: 1
            )
        }
    }


    // MARK: - Image Layer

    private func imageLayer(
        _ name: String,
        size: CGSize
    ) -> some View {

        Image(name)
            .resizable()
            .scaledToFill()
            .frame(
                width: size.width,
                height: size.height
            )
            .clipped()
    }


    // MARK: - Label

    private func comparisonLabel(
        _ text: String
    ) -> some View {

        Text(text)
            .font(
                .system(
                    size: 14,
                    weight: .semibold
                )
            )
            .foregroundStyle(.black)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.white)
            .clipShape(
                Capsule()
            )
            .shadow(
                color: .black.opacity(0.08),
                radius: 3,
                y: 1
            )
    }


    // MARK: - Label animations

    private var beforeLabelOpacity: Double {

        if sliderFraction < 0.08 {
            return 0
        }

        if sliderFraction < 0.18 {
            return Double(sliderFraction - 0.08) / 0.10
        }

        return 1
    }


    private var afterLabelOpacity: Double {

        if sliderFraction > 0.92 {
            return 0
        }

        if sliderFraction > 0.82 {
            return Double(0.92 - sliderFraction) / 0.10
        }

        return 1
    }
}
