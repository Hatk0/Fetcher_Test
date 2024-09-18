import Foundation

struct Model: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}
