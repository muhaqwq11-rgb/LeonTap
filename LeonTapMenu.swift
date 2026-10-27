import SwiftUI

struct LeonTapMenu: View {
    @Binding var greenChams: Bool
    @Binding var blueChams: Bool
    @Binding var wireframeChams: Bool
    @Binding var rgbChams: Bool
    @State private var isOpen = true

    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            if isOpen {
                VStack(spacing: 0) {
                    HStack(spacing: 9) {
                        Image(systemName: "bolt.fill")
                            .font(.title2.bold()).foregroundStyle(.cyan)
                        Text("LeonTap").font(.system(size: 22, weight: .black, design: .rounded))
                            .foregroundStyle(.green)
                        Spacer()
                        Button { withAnimation(.spring()) { isOpen = false } } label: {
                            Image(systemName: "xmark").foregroundStyle(.white).padding(7)
                        }
                    }
                    .padding(12)
                    .background(LinearGradient(colors: [.red, Color(red: 0.55, green: 0.02, blue: 0.12)],
                                               startPoint: .leading, endPoint: .trailing))
                    row("Green Chams", color: .green, value: $greenChams)
                    row("Blue Chams", color: .cyan, value: $blueChams)
                    row("WireFrame Chams", color: .red, value: $wireframeChams)
                    row("RGB Chams", color: .purple, value: $rgbChams)
                    Text("VISUAL SETTINGS")
                        .font(.system(size: 9, weight: .heavy, design: .rounded))
                        .tracking(1.3).foregroundStyle(.yellow)
                        .frame(maxWidth: .infinity).padding(9).background(.red.opacity(0.9))
                }
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(.cyan, lineWidth: 1.5))
                .shadow(color: .cyan.opacity(0.25), radius: 18)
                .frame(width: 278)
                .transition(.scale.combined(with: .opacity))
            }
            Button {
                withAnimation(.spring()) { isOpen.toggle() }
            } label: {
                Label("LEON", systemImage: "bolt.fill")
                    .font(.system(size: 14, weight: .black, design: .rounded))
                    .foregroundStyle(.white).padding(.horizontal, 17).frame(height: 44)
                    .background(LinearGradient(colors: [.cyan, .blue, .purple],
                                               startPoint: .leading, endPoint: .trailing),
                                in: Capsule())
                    .overlay(Capsule().stroke(.white.opacity(0.8), lineWidth: 1))
                    .shadow(color: .cyan.opacity(0.4), radius: 12)
            }.buttonStyle(.plain)
        }
    }

    private func row(_ title: String, color: Color, value: Binding<Bool>) -> some View {
        Toggle(isOn: value) {
            HStack(spacing: 8) {
                Image(systemName: "sparkles").foregroundStyle(color).frame(width: 18)
                Text(title).font(.system(size: 13, weight: .bold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.85))
            }
        }
        .tint(.green)
        .padding(.horizontal, 10).padding(.vertical, 7)
        .background(Color.cyan.opacity(0.9))
        .overlay(alignment: .bottom) { Rectangle().fill(.black.opacity(0.14)).frame(height: 1) }
    }
}
