import Foundation

class WorkItemBuilder {
    public var ID: Int?
    public var title: String?
    public var description: String?
    public var startDate: String?
    public var endDate: String?
    public var priority: TaskPriority?
    
    init(title: String) {
        self.title = title;
    }

    func ID(_ ID: Int) -> WorkItemBuilder {
        self.ID = ID
        return self
    }

    func description(_ description: String) -> WorkItemBuilder {
        self.description = description
        return self
    }

    func startDate(_ startDate: String) -> WorkItemBuilder {
        self.startDate = startDate
        return self
    }

    func endDate(_ endDate: String) -> WorkItemBuilder {
        self.endDate = endDate
        return self
    }

    func priority(_ priority: TaskPriority) -> WorkItemBuilder {
        self.priority = priority
        return self
    }

    func buildTask() -> Task? {
        return Task(builder: self)
    }

    func buildLabWork() -> LabWork? {
        return LabWork(builder: self)
    }
}
