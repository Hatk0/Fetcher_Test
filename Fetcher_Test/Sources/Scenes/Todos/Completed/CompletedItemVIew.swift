import SwiftUI

struct CompletedItemView: View {
    @EnvironmentObject private var colorManager: ColorManager
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(.systemGray3))
                    .opacity(0.4)
                
                Image(systemName: "wifi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(colorManager.greenColor)
            }
            
            Text("Buy Bread")
                .font(.custom("IBMPlexSans-Medium", size: 17))
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    CompletedItemView()
}
