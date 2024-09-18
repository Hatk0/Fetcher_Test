import Foundation

final class NetworkManager {
    func getData(forUser userId: Int? = nil) async throws -> Data {
        guard let url = createURL(forUser: userId), let urlRequest = createRequest(url: url) else {
            throw NetworkError.invalidResponse
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200:
            return data
        default:
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
    }
    
    func decodeData(_ data: Data) throws -> [Model] {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode([Model].self, from: data)
            return result
        } catch {
            throw NetworkError.decodingError
        }
    }
}

private extension NetworkManager {
    func createURL(forUser userId: Int? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/todos"
        if let userId = userId {
            components.queryItems = [URLQueryItem(name: "userId", value: "\(userId)")]
        }
        return components.url
    }
    
    func createRequest(url: URL?) -> URLRequest? {
        guard let url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
}
