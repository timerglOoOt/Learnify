import Foundation
import UIKit

protocol Coordinator {
    var window: UIWindow { get set }

    func start()
}
