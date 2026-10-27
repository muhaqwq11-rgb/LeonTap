import SwiftUI

struct RainbowTransparentFrame: View {
    var cornerRadius: CGFloat = 24
    var lineWidth: CGFloat = 3
    var glowRadius: CGFloat = 10
    @State private var angle = 0.0

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(
                AngularGradient(
                    colors: [.cyan, .blue, .purple, .pink, .red, .orange, .yellow, .green, .cyan],
                    center: .center,
                    angle: .degrees(angle)
                ),
                lineWidth: lineWidth
            )
            .shadow(color: .cyan.opacity(0.5), radius: glowRadius)
            .shadow(color: .purple.opacity(0.32), radius: glowRadius * 0.6)
            .background(Color.clear)
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                    angle = 360
                }
            }
    }
}
