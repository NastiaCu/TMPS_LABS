import Foundation

class Menu{
    
    private let pdfReportGenerator: ReportGeneratorProtocol

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
                    if let taskDetails = userInput.getTaskDetails() {
                        let task = Task(ID: taskDetails.0, title: taskDetails.1, description: taskDetails.2, priority: taskDetails.3)
                        manager.addWork(workItem: task)
                        print("Task added.")
                    }
                case "2":
                    if let labWorkDetails = userInput.getLabWorkDetails() {
                        let labWork = LabWork(ID: labWorkDetails.0, title: labWorkDetails.1, description: labWorkDetails.2, startDate: labWorkDetails.3, endDate: labWorkDetails.4)
                        manager.addWork(workItem: labWork)
                        print("Lab Work added.")
                    }
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
}
