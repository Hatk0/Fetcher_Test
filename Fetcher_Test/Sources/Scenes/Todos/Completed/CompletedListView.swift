import SwiftUI

struct CompletedListView: View {
    @ObservedObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            ScrollView {
                ForEach(mainViewModel.completedTodos) { todo in
                    CompletedItemView(todo: todo) { updatedTodo in
                        mainViewModel.toggleTodoStatus(id: updatedTodo.id)
                    }
                    .padding(.top, 10)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
