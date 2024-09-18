import SwiftUI

struct NotCompletedListView: View {
    @ObservedObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Not completed")
                .font(.custom("IBMPlexSans-Medium", size: 14))
            
            Divider()
            
            ScrollView {
                ForEach(mainViewModel.notCompletedTodos) { todo in
                    NotCompletedItemView(todo: todo) { updatedTodo in
                        mainViewModel.toggleTodoStatus(id: updatedTodo.id)
                    }
                    .padding(.top, 10)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
