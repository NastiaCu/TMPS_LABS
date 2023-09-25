import Foundation

class LabWork: WorkItem, LabWorkProtocol {
    var startDate: String
    var endDate: String

    init(ID: Int, title: String, description: String, startDate: String, endDate: String) {
        self.startDate = startDate
        self.endDate = endDate
        super.init(ID: ID, title: title, description: description)
    }
}
