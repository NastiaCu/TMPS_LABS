import Foundation

class Menu{
    
    private let pdfReportGenerator: ReportGeneratorProtocol

    private let taskFactory = TaskFactory()
    private let labWorkFactory = LabWorkFactory()
    
    init(pdfReportGenerator: ReportGeneratorProtocol) {
        self.pdfReportGenerator = pdfReportGenerator
    }
    
    func mainMenu(manager: Manager, userInput: UserInputManager) {
        var shouldExit = false

        while !shouldExit {
            print("Main Menu:")
            print("1. Add Task")
            print("2. Add Lab Work")
            print("3. Generate Reports")
            print("4. Exit")
            print("Enter your choice:")

            if let choice = userInput.getInput() {
                switch choice {
                case "1":
                    addTask()
                case "2":
                    addLabWork()
                case "3":
                    pdfReportGenerator.generateReports(manager: manager, reportGenerator: pdfReportGenerator)
                case "4":
                    shouldExit = true
                default:
                    print("Invalid choice. Please enter a valid option.")
                }
            }
        }
    }
    
    private func addTask() {
        if let taskDetails = userInput.getTaskDetails() {
            let taskBuilder = WorkItemBuilder(title: taskDetails.1)
                .ID(taskDetails.0)
                .description(taskDetails.2)
                .priority(taskDetails.3)

            if let task = taskFactory.createTask(builder: taskBuilder) {
                Manager.shared.addWork(workItem: task)
                print("Task added.")
            }
        }
    }
    
    private func addLabWork() {
        if let labWorkDetails = userInput.getLabWorkDetails() {
            let labWorkBuilder = WorkItemBuilder(title: labWorkDetails.1)
                .ID(labWorkDetails.0)
                .description(labWorkDetails.2)
                .startDate(labWorkDetails.3)
                .endDate(labWorkDetails.4)

            if let labWork = labWorkFactory.createLabWork(builder: labWorkBuilder) {
                Manager.shared.addWork(workItem: labWork)
                print("Lab Work added.")
            }
        }
    }
}
