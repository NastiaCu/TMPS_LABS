import Foundation

class Task: WorkItem, TaskProtocol {
    var priority: TaskPriority

    init(builder: WorkItemBuilder) {
        self.priority = builder.priority ?? .low
        super.init(ID: builder.ID ?? 0, title: builder.title ?? "", description: builder.description ?? "")
    }
}
