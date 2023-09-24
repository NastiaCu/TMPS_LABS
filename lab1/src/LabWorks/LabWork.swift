import Foundation

class LabWork: LabWorkProtocol {
    var labWorkID: Int
    var name: String
    var description: String
    var startDate: String
    var endDate: String

    init(labWorkID: Int, name: String, description: String, startDate: String, endDate: String) {
        self.labWorkID = labWorkID
        self.name = name
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
    }
}
