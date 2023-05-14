import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
