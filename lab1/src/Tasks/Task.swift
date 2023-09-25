import Foundation

class Task: WorkItem, TaskProtocol {
    var priority: TaskPriority

    init(ID: Int, title: String, description: String, priority: TaskPriority) {
        self.priority = priority
        super.init(ID: ID, title: title, description: description)
    }
}
