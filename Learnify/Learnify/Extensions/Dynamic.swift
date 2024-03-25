import Foundation

// MARK: - Хайруллин Тимур

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?

    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }

    init(_ val: T) {
        value = val
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
