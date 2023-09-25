import Foundation

protocol ReportGeneratorProtocol {
    func generateTaskReport(task: Task) -> String
    func generateLabWorkReport(labWork: LabWork) -> String
}
