import Foundation

protocol TaskProtocol {
    var taskID: Int { get set }
    var title: String { get set }
    var description: String { get set }
    var priority: TaskPriority { get set }
}