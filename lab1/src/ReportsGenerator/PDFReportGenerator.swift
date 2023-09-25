import Foundation

class PDFReportGenerator: ReportGeneratorProtocol{
    
    func generateTaskReport(task: Task) -> String {
        let report = """
            Task ID: \(task.ID)
            Title: \(task.title)
            Description: \(task.description)
            Priority: \(task.priority)
            """
        return report
    }
    
    func generateLabWorkReport(labWork: LabWork) -> String {
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
