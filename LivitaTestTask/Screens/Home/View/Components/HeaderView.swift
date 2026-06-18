import SwiftUI

struct HeaderView: View {

    @State private var showComingSoonAlert = false

    var body: some View {
        HStack {
            Button {
                showComingSoonAlert = true
            } label: {
                Text("GET PRO")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(AppTheme.proGradient)
                    .clipShape(Capsule())
            }

            Spacer()

            Button {
                showComingSoonAlert = true
            } label: {
                Image("userIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 12)
        .comingSoonAlert(isPresented: $showComingSoonAlert)
    }
}
