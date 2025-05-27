import SwiftUI

struct ToggleRowView: View {
    var label: String
    var subtitle: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .font(.headline)
                
                Text(subtitle)
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .font(.subheadline)
            }
            
            Spacer()
            
            ThreeDToggleView(isOn: $isOn)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
