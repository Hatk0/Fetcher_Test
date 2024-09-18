import Foundation

class MainViewModel: ObservableObject {
    @Published var todos: [Model] = []
    @Published var isToggled: Bool = false
    
    private let networkManager = NetworkManager()
    
    private var userId: Int? {
        isToggled ? 5 : nil
    }
    
    func fetchBreweries() async {
        do {
            let data = try await networkManager.getData(forUser: userId)
            let decodedTodos = try networkManager.decodeBreweryData(data)
            
            DispatchQueue.main.async {
                self.todos = decodedTodos
            }
        } catch {
            print("Error fetching todos: \(error)")
        }
    }
    
    var completedTodos: [Model] {
        todos.filter { $0.completed }
    }
    
    var notCompletedTodos: [Model] {
        todos.filter { !$0.completed }
    }
}
