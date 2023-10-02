import Foundation

protocol ReportGenerationStrategy {
    func generateReport(workItem: WorkItemProtocol) -> String
}
