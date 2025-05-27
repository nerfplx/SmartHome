import SwiftUI

struct SceneModalView: View {
    @Binding var isPresented: Bool
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                
                ScrollView {
                    VStack(spacing: 12) {
                        Capsule()
                            .fill(.gray.opacity(0.7))
                            .frame(width: 40, height: 5)
                            .padding(.top, 8)
                        
                        SceneRowView(time: "7:00pm", frequency: "Daily", scenes: 3, accessories: 11)
                        SceneRowView(time: "1:00pm", frequency: "Daily", scenes: 1, accessories: 2)
                        SceneRowView(time: "11:00pm", frequency: "Daily", scenes: 2, accessories: 8)
                        SceneRowView(time: "13:00pm", frequency: "Daily", scenes: 2, accessories: 14)
                        
                    }
                    .padding()
                }
                .frame(height: geometry.size.height * 0.4)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [Color(#colorLiteral(red: 0.4717482924, green: 0.6732385159, blue: 0.9112386107, alpha: 1)), Color(#colorLiteral(red: 0.8661987185, green: 0.8311980367, blue: 0.9146956801, alpha: 1)), .white],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .offset(y: dragOffset.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            if value.translation.height > 0 {
                                state = value.translation
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 100 {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                )
            }
        }
    }
}

#Preview{
    ScenesView()
}
