import Foundation

class MainViewModel: ObservableObject {
    @Published var networkManager = NetworkManager()
    @Published var isToggled: Bool = false
    
    func fetchBreweries() async {
        let userId: Int? = isToggled ? 5 : nil
        
        do {
            let data = try await networkManager.getData(forUser: userId)
            let breweries = try networkManager.decodeBreweryData(data)
            
            for brewery in breweries {
                print("""
                \(brewery.userId)
                \(brewery.id)
                \(brewery.title)
                \(brewery.completed)
                =======
                """)
            }
        } catch NetworkError.invalidResponse {
            print("Invalid response")
        } catch NetworkError.invalidStatusCode(let code) {
            print("Invalid status code: \(code)")
        } catch NetworkError.decodingError {
            print("Decoding error")
        } catch NetworkError.otherError(let description) {
            print("Other error: \(description)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
}
