import Foundation

class LabWork: WorkItem, LabWorkProtocol {
    var startDate: String
    var endDate: String

    init(builder: WorkItemBuilder) {
        self.startDate = builder.startDate ?? ""
        self.endDate = builder.endDate ?? ""
        super.init(ID: builder.ID ?? 0, title: builder.title ?? "", description: builder.description ?? "")
    }
}
