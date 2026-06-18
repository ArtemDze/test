import SwiftUI

struct ResultView: View {

    let beforeImage: String
    let afterImage: String
    let title: String

    @State private var showComingSoonAlert = false

    var body: some View {
        ZStack{
            AppTheme.background.ignoresSafeArea()
            
            VStack {
                BeforeAfterSlider(
                    beforeImage: beforeImage,
                    afterImage: afterImage
                )
                .padding(.horizontal, 16)
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                
                VStack(spacing: 12) {
                    
                    HStack(spacing: 12) {
                        secondaryButton(title: "Resize", icon: "resize")
                        secondaryButton(title: "Save", icon: "save")
                    }
                    
                    Button {
                        showComingSoonAlert = true
                    } label: {
                        HStack(spacing: 8) {
                            Image("regenerate")
                            Text("Regenerate")
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(.black)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
        }
    }

    private func secondaryButton(title: String, icon: String) -> some View {
        Button {
            showComingSoonAlert = true
        } label: {
            HStack(spacing: 8) {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)

                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(.white)
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(Color.black.opacity(0.12), lineWidth: 1)
            }
            .comingSoonAlert(isPresented: $showComingSoonAlert)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ResultView(beforeImage: "before1", afterImage: "after1", title: "Test")
}
