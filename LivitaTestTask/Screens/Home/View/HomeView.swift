import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    HeaderView()

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.cards) { card in
                                NavigationLink {
                                    ResultView(
                                        beforeImage: card.beforeImage,
                                        afterImage: card.afterImage,
                                        title: card.title
                                    )
                                } label: {
                                    ToolCardView(card: card)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 96)
                    }
                }

                FloatingTabBar()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
