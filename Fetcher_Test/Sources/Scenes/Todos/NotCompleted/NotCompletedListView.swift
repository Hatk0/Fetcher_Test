import SwiftUI

struct NotCompletedListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Not completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            NotCompletedItemView()
                .padding(.top, 10)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    NotCompletedListView()
}
