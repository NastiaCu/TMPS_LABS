import Foundation

class LabWorkFactory {
    func createLabWork(builder: WorkItemBuilder) -> LabWork? {
        return LabWork(builder: builder)
    }
}
