import Foundation

class PDFReportGenerator: ReportGeneratorProtocol{
    
    func generateTaskReport(task: TaskProtocol) -> String {
        let report = """
            Task ID: \(task.taskID)
            Title: \(task.title)
            Description: \(task.description)
            Priority: \(task.priority)
            """
        return report
    }
    
    func generateLabWorkReport(labWork: LabWorkProtocol) -> String {
        let report = """
            Lab Work ID: \(labWork.labWorkID)
            Name: \(labWork.name)
            Description: \(labWork.description)
            Start Date: \(labWork.startDate)
            End Date: \(labWork.endDate)
            """
        return report
    }
}