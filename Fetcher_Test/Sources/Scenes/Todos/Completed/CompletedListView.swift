import SwiftUI

struct CompletedListView: View {
    let completedTodos: [Model]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            ScrollView {
                ForEach(completedTodos, id: \.id) { todo in
                    CompletedItemView(title: todo.title)
                        .padding(.top, 10)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
