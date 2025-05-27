import SwiftUI

struct GridIcons: View {
    let icons = ["circle.grid.2x2", "lightbulb", "cloud.sun", "gear", "thermometer", "camera", "wifi", "lock", "phone", "tv", "music.note", "house"]
    
    @Binding var showModal: Bool
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 4), spacing: 20) {
            ForEach(icons, id: \.self) { icon in
                let isMainIcon = icon == icons.first
                let isPressed = isMainIcon && showModal
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(18)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .background(isPressed ? Color(#colorLiteral(red: 0.1628934443, green: 0.1819693446, blue: 0.268445313, alpha: 1)) : .white.opacity(0.1))
                    .clipShape(Circle())
                    .shadow(color: .white.opacity(0.3), radius: isPressed ? 1 : 5, x: 0, y: isPressed ? 1 : 4)
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isPressed)
                    .onTapGesture {
                        if isMainIcon {
                            withAnimation {
                                showModal.toggle()
                            }
                        }
                    }
            }
        }
        .padding()
    }
}
