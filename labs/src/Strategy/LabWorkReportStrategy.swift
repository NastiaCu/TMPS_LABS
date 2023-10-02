import Foundation

class LabWorkReportStrategy: ReportGenerationStrategy {
    func generateReport(workItem: WorkItemProtocol) -> String {
        guard let labWork = workItem as? LabWork else {
            return "Invalid work item type for LabWorkReportStrategy"
        }

        let report = """
            Lab Work ID: \(labWork.ID)
            Name: \(labWork.title)
            Description: \(labWork.description)
            Start Date: \(labWork.startDate)
            End Date: \(labWork.endDate)
            """
        return report
    }
}
