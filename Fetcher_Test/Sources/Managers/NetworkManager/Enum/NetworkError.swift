enum NetworkError: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError
    case otherError(String)
}
