import Foundation

class Task: TaskProtocol {
    var taskID: Int
    var title: String
    var description: String
    var priority: TaskPriority

    init(taskID: Int, title: String, description: String, priority: TaskPriority) {
        self.taskID = taskID
        self.title = title
        self.description = description
        self.priority = priority
    }
}
