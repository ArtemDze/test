import SwiftUI

extension View {
    func comingSoonAlert(isPresented: Binding<Bool>) -> some View {
        alert("Coming Later", isPresented: isPresented) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("This feature will be available soon.")
        }
    }
}
