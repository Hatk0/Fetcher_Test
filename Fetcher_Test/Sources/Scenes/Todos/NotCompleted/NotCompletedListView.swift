import SwiftUI

struct NotCompletedListView: View {
    let notCompletedTodos: [Model]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Not completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            ScrollView {
                ForEach(notCompletedTodos, id: \.id) { todo in
                    NotCompletedItemView(title: todo.title)
                        .padding(.top, 10)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
