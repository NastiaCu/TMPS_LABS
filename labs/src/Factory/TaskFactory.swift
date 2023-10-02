import Foundation

class TaskFactory {
    func createTask(builder: WorkItemBuilder) -> Task? {
        return Task(builder: builder)
    }
}
