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
    
    func generateReports(manager: Manager, reportGenerator: ReportGeneratorProtocol) {
        print("")
        print("Generating Reports:")
        
        let allWorks = manager.getAllWorks()
        
        for workItem in allWorks {
            if let task = workItem as? Task {
                let taskReport = reportGenerator.generateTaskReport(task: task)
                print("Task Report:")
                print(taskReport)
                print("")
            }
            else if let labWork = workItem as? LabWork {
                let labWorkReport = reportGenerator.generateLabWorkReport(labWork: labWork)
                print("Lab Work Report:")
                print(labWorkReport)
            }
        }
        print(" ")
    }
}
