import Foundation

class TaskReportStrategy: ReportGenerationStrategy {
    func generateReport(workItem: WorkItemProtocol) -> String {
        guard let task = workItem as? Task else {
            return "Invalid work item type for TaskReportStrategy"
        }

        let report = """
            Task ID: \(task.ID)
            Title: \(task.title)
            Description: \(task.description)
            Priority: \(task.priority)
            """
        return report
    }
}
