import SwiftUI

struct ThreeDToggleView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: isOn ?
                        [Color(#colorLiteral(red: 0.4953866601, green: 0.4757600427, blue: 0.6362771392, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.6695542336, green: 0.6288432479, blue: 0.7458895445, alpha: 1))] :
                            [Color(#colorLiteral(red: 0.4279466867, green: 0.4400041103, blue: 0.5686287284, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 0.6732221246, green: 0.6732285023, blue: 0.7852266431, alpha: 1)).opacity(0.7)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 60, height: 32)
                .shadow(color: isOn ? .gray.opacity(0.6) : .black.opacity(0.4), radius: 4, x: 0, y: 2)
            
            HStack {
                if isOn { Spacer() }
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: isOn ?
                                               [Color.white, Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))] :
                                                [Color.white, Color(#colorLiteral(red: 0.43, green: 0.47, blue: 0.68, alpha: 1))]),
                            center: .center,
                            startRadius: 1,
                            endRadius: 20
                        )
                    )
                    .frame(width: 28, height: 28)
                if !isOn { Spacer() }
            }
            .frame(maxWidth: 58)
            .padding(2)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isOn.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
