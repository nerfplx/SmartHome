import SwiftUI

struct ScenesView: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1772289574, green: 0.1772357821, blue: 0.2772281468, alpha: 1)), Color(#colorLiteral(red: 0.3161211908, green: 0.3995832205, blue: 0.4757526517, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 32) {
                HStack {
                    Image(systemName: "arrow.backward")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Text("Home")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "lightbulb.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.8835677505, green: 0.9524340034, blue: 0.9932301641, alpha: 1)))
                            .font(.largeTitle)
                            .shadow(color: .white.opacity(0.7), radius: 5)
                            .background(
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 60, height: 60)
                            )
                        Text("1")
                            .font(.caption).bold()
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                            .background(Circle().fill(Color(#colorLiteral(red: 0.514855206, green: 0.5341985822, blue: 0.6988292336, alpha: 1))))
                            .offset(x: 12, y: -12)
                    }
                }
                .padding()
                
                GridIcons(showModal: $showModal)
            }
            .padding(.horizontal)
            
            if showModal {
                SceneModalView(isPresented: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .ignoresSafeArea(edges: .bottom)
                    .zIndex(1)
            }
        }
    }
}

#Preview{
    ScenesView()
}
