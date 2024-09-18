import SwiftUI

struct CompletedListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            CompletedItemView()
                .padding(.top, 10)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    CompletedListView()
}
