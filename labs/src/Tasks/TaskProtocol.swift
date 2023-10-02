import Foundation

protocol TaskProtocol {
    var priority: TaskPriority { get set }
    func clone() -> Self
}
