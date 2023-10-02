import Foundation

class LabWork: WorkItem, LabWorkProtocol, Cloning {
    var startDate: String
    var endDate: String

    init(builder: WorkItemBuilder) {
        self.startDate = builder.startDate ?? "No Start Date"
        self.endDate = builder.endDate ?? "No End Date"
        super.init(ID: builder.ID ?? 0, title: builder.title ?? "", description: builder.description ?? "No description")
    }
    
    func clone() -> Self {
        let labWorkCopy = LabWork(builder: WorkItemBuilder(title: self.title))
        labWorkCopy.ID = self.ID + 1
        labWorkCopy.description = self.description
        labWorkCopy.startDate = self.startDate
        labWorkCopy.endDate = self.endDate
        return labWorkCopy as! Self
    }
}
