import SwiftUI

struct NotCompletedItemView: View {
    var title: String
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(.systemGray3))
                    .opacity(0.4)
                
                Image(systemName: "multiply")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            }
            
            Text(title)
                .font(.custom("IBMPlexSans-Medium", size: 17))
            
            Spacer()
            
            Circle()
                .frame(width: 13, height: 13)
                .foregroundColor(.red)
        }
    }
}
