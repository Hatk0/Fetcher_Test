import SwiftUI

struct NotCompletedItemView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(.systemGray3))
                    .opacity(0.4)
                
                Image(systemName: "exclamationmark.shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
            
            Text("Buy Butter")
                .font(.custom("IBMPlexSans-Medium", size: 17))
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "multiply")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NotCompletedItemView()
}
