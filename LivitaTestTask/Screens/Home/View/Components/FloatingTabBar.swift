import SwiftUI

struct FloatingTabBar: View {

    @State private var showComingSoonAlert = false

    var body: some View {
        HStack(spacing: 0) {
            tab(icon: "sparkles", title: "Tools", selected: true)
            tab(icon: "photo.on.rectangle.angled", title: "Gallery", showsAlert: true)
            tab(icon: "safari", title: "Discover", showsAlert: true)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
        .background(.white)
        .clipShape(Capsule())
        .shadow(color: AppTheme.tabBarShadow, radius: 16, x: 0, y: 4)
        .padding(.horizontal, 24)
        .padding(.bottom, 8)
        .comingSoonAlert(isPresented: $showComingSoonAlert)
    }

    private func tab(
        icon: String,
        title: String,
        selected: Bool = false,
        showsAlert: Bool = false
    ) -> some View {
        Button {
            if showsAlert {
                showComingSoonAlert = true
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .regular))

                Text(title)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundStyle(selected ? .black : AppTheme.tabInactive)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
