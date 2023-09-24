import Foundation

protocol ReportGeneratorProtocol {
    func generateTaskReport(task: TaskProtocol) -> String
    func generateLabWorkReport(labWork: LabWorkProtocol) -> String
}