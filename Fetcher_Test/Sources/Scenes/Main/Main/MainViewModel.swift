import Foundation

class MainViewModel: ObservableObject {
    @Published var todos: [Model] = []
    @Published var isToggled: Bool = false
    
    private let networkManager = NetworkManager()
    
    private var userId: Int? {
        isToggled ? 5 : nil
    }
    
    func fetchToDos() async {
        do {
            let data = try await networkManager.getData(forUser: userId)
            let decodedTodos = try networkManager.decodeData(data)
            
            DispatchQueue.main.async {
                self.todos = decodedTodos
            }
        } catch {
            print("Error fetching todos: \(error)")
        }
    }
    
    func toggleTodoStatus(id: Int) {
        if let index = todos.firstIndex(where: { $0.id == id }) {
            todos[index].completed.toggle()
        }
    }
    
    var completedTodos: [Model] {
        todos.filter { $0.completed }
    }
    
    var notCompletedTodos: [Model] {
        todos.filter { !$0.completed }
    }
}
