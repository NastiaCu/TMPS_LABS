import Foundation

class PDFReportGenerator: ReportGeneratorProtocol{
    
    private var taskReportStrategy = TaskReportStrategy()
    private var labWorkReportStrategy = LabWorkReportStrategy()
        
    func generateTaskReport(task: Task) -> String {
        return taskReportStrategy.generateReport(workItem: task)
    }
    
    func generateLabWorkReport(labWork: LabWork) -> String {
        return labWorkReportStrategy.generateReport(workItem: labWork)
    }
    
    func generateReports(manager: ManagerProtocol, reportGenerator: ReportGeneratorProtocol) {
        print("")
        print("Generating Reports:")
        
        let allWorks = manager.getAllWorks()
        
        for workItem in allWorks {
            if let task = workItem as? Task {
                let taskReport = generateTaskReport(task: task)
                print("Task Report:")
                print(taskReport)
                print("")
            }
            else if let labWork = workItem as? LabWork {
                let labWorkReport = generateLabWorkReport(labWork: labWork)
                print("Lab Work Report:")
                print(labWorkReport)
                print("")
            }
        }
    }
}
