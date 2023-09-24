import Foundation

let taskManager: TaskManagerProtocol = TaskManager()

let task1 = Task(taskID: 1, title: "Finish project proposal", description: "Due next week", priority: .high)
let task2 = Task(taskID: 2, title: "Buy groceries", description: "Milk, eggs, bread", priority: .medium)

taskManager.addTask(task: task1)
taskManager.addTask(task: task2)

let labWorkManager: LabWorkManagerProtocol = LabWorkManager()

let labWork1 = LabWork(labWorkID: 1, name: "TMPS_LAB 1", description: "SOLID principles", startDate: "2023-09-7", endDate: "2023-09-20")
let labWork2 = LabWork(labWorkID: 2, name: "PR_LAB 2", description: "Scraper", startDate: "2023-09-22", endDate: "2023-09-28")

labWorkManager.addLabWork(labWork: labWork1)
labWorkManager.addLabWork(labWork: labWork2)

let reportGenerator: ReportGeneratorProtocol = PDFReportGenerator()

let taskReport = reportGenerator.generateTaskReport(task: task1)
let labWorkReport = reportGenerator.generateLabWorkReport(labWork: labWork1)

print("Task Report:")
print(taskReport)

print("\nLab Work Report:")
print(labWorkReport)
