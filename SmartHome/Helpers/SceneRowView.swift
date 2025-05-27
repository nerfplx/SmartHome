import SwiftUI

struct SceneRowView: View {
    var image: Image = Image(systemName: "timer")
    var time: String
    var frequency: String
    var scenes: Int
    var accessories: Int
    
    var body: some View {
        HStack {
            Text(image)
                .font(.title3)
                .foregroundStyle(.white)
                .padding(8)
                .background(Color(#colorLiteral(red: 0.28158167, green: 0.3373709321, blue: 0.5226061344, alpha: 1)))
                .clipShape(.circle)
                .padding(.horizontal, 4)
            VStack(alignment: .leading) {
                Text("\(time), \(frequency)")
                    .foregroundColor(.black)
                    .font(.headline)
                Text("\(scenes) scenes, \(accessories) accessories")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ScenesView()
}
