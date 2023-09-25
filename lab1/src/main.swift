import Foundation

let taskManager: ManagerProtocol = Manager()

let task1 = Task(ID: 1, title: "Finish project proposal", description: "Due next week", priority: .high)
let task2 = Task(ID: 2, title: "Buy groceries", description: "Milk, eggs, bread", priority: .medium)

taskManager.addWork(workItem: task1)
taskManager.addWork(workItem: task2)

let labWorkManager: ManagerProtocol = Manager()

let labWork1 = LabWork(ID: 1, title: "TMPS_LAB 1", description: "SOLID principles", startDate: "2023-09-7", endDate: "2023-09-20")
let labWork2 = LabWork(ID: 2, title: "PR_LAB 2", description: "Scraper", startDate: "2023-09-22", endDate: "2023-09-28")

labWorkManager.addWork(workItem: labWork1)
labWorkManager.addWork(workItem: labWork2)

let reportGenerator: ReportGeneratorProtocol = PDFReportGenerator()

let taskReport = reportGenerator.generateTaskReport(task: task1)
let labWorkReport = reportGenerator.generateLabWorkReport(labWork: labWork1)

print("Task Report:")
print(taskReport)

print("\nLab Work Report:")
print(labWorkReport)
