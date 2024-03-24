import Foundation

// MARK: - Хайруллин Тимур

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ val: T) {
        value = val
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
