import Foundation

// MARK: - Хайруллин Тимур
extension Array {
    func arrayToString() -> String {
        return self.map { "\($0)" }.joined(separator: ", ")
    }
}
