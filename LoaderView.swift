import SwiftUI

struct LoaderView: View {
    @State private var showMenu = false
    @State private var greenChams = true
    @State private var blueChams = false
    @State private var wireframe = false
    @State private var rgb = true

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.015, green: 0.025, blue: 0.07),
                                    Color(red: 0.035, green: 0.08, blue: 0.17),
                                    .black],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 22) {
                Spacer()
                ZStack {
                    RainbowTransparentFrame(cornerRadius: 38, lineWidth: 4, glowRadius: 17)
                        .frame(width: 154, height: 154)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 55, weight: .black))
                        .foregroundStyle(LinearGradient(colors: [.cyan, .blue, .purple],
                                                        startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: .cyan.opacity(0.8), radius: 20)
                }
                Text("LEON")
                    .font(.system(size: 43, weight: .black, design: .rounded))
                    .tracking(7)
                    .foregroundStyle(.white)
                    .shadow(color: .cyan.opacity(0.8), radius: 16)
                Text("TRAINING • CUSTOMIZATION • STYLE")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(2)
                    .foregroundStyle(.cyan.opacity(0.85))

                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.78)) {
                        showMenu.toggle()
                    }
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "bolt.fill")
                        Text(showMenu ? "CLOSE LEONTAP" : "OPEN LEONTAP")
                            .font(.system(size: 15, weight: .black, design: .rounded))
                            .tracking(1.4)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: 285, minHeight: 54)
                    .background(LinearGradient(colors: [.cyan, .blue, .purple],
                                               startPoint: .leading, endPoint: .trailing),
                                in: Capsule())
                    .overlay(Capsule().stroke(.white.opacity(0.8), lineWidth: 1))
                    .shadow(color: .cyan.opacity(0.4), radius: 18)
                }
                .buttonStyle(.plain)

                Spacer()
                Text("iOS • LEON LOADER")
                    .font(.system(size: 10, weight: .medium, design: .monospaced))
                    .foregroundStyle(.white.opacity(0.45))
                    .padding(.bottom, 18)
            }
            .padding(.horizontal, 26)

            if showMenu {
                VStack {
                    HStack {
                        Spacer()
                        LeonTapMenu(greenChams: $greenChams,
                                    blueChams: $blueChams,
                                    wireframeChams: $wireframe,
                                    rgbChams: $rgb)
                    }
                    Spacer()
                }
                .padding(.top, 12)
                .padding(.trailing, 12)
                .transition(.opacity.combined(with: .scale(scale: 0.94)))
            }
        }
        .preferredColorScheme(.dark)
    }
}

