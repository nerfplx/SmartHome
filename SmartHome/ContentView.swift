import SwiftUI

struct ContentView: View {
    @State private var isLightOn = true
    @State private var isCameraOn = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.17, green: 0.18, blue: 0.29, alpha: 1)), Color(#colorLiteral(red: 0.1334979832, green: 0.2946546972, blue: 0.4914662242, alpha: 1)), Color(#colorLiteral(red: 0.7709720135, green: 0.7674056888, blue: 0.8905107975, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "line.horizontal.3")
                    Spacer()
                    Image(systemName: "moon")
                }
                .padding()
                .font(.title)
                .foregroundStyle(.gray)
                
                Text("25°")
                    .font(.system(size: 48))
                    .bold()
                    .blur(radius: 0.3)
                    .foregroundColor(.white)
                
                Image("3d_house")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 400)
                
                VStack {
                    ToggleRowView(label: "Light", subtitle: "Outdoor", isOn: $isLightOn)
                    
                    Divider()
                        .frame(height: 10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5724158883, green: 0.6064161658, blue: 0.8592080474, alpha: 1)), Color(#colorLiteral(red: 0.717007041, green: 0.7061212659, blue: 0.8731510043, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 32)
                    
                    ToggleRowView(label: "Camera", subtitle: "Front Door", isOn: $isCameraOn)
                }
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}
