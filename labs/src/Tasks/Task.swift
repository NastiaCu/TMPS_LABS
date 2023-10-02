import Foundation

class Task: WorkItem, TaskProtocol, Cloning {
    var priority: TaskPriority

    init(builder: WorkItemBuilder) {
        self.priority = builder.priority ?? .low
        super.init(ID: builder.ID ?? 0, title: builder.title ?? "", description: builder.description ?? "No description")
    }
    
    func clone() -> Self {
        let taskCopy = Task(builder: WorkItemBuilder(title: self.title))
        taskCopy.ID = self.ID + 1
        taskCopy.description = self.description
        taskCopy.priority = self.priority
        return taskCopy as! Self
     }
}
