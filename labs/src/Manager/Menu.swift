import Foundation

class Menu: MenuProtocol{
    
    private let pdfReportGenerator: ReportGeneratorProtocol

    private let taskFactory = TaskFactory()
    private let labWorkFactory = LabWorkFactory()
    
    init(pdfReportGenerator: ReportGeneratorProtocol) {
        self.pdfReportGenerator = pdfReportGenerator
    }
    
    func mainMenu(manager: ManagerProtocol, userInput: UserInputManager) {
        var shouldExit = false

        while !shouldExit {
            print("Main Menu:")
            print("1. Add Task")
            print("2. Add Lab Work")
            print("3. Generate Reports")
            print("4. Clone a Task")
            print("5. Clone a Lab Work")
            print("6. Exit")
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
                    cloneTask()
                case "5":
                    cloneLabWork()
                case "6":
                    shouldExit = true
                default:
                    print("Invalid choice. Please enter a valid option.")
                }
            }
        }
    }
    
    func addTask() {
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
    
    func addLabWork() {
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
    
    func cloneTask() {
        print("Enter the ID of the Task you want to clone:")
        if let taskID = userInput.toInt() {
            if let originalTask = manager.getWorkByID(ID: taskID) as? Task {
                let clonedTask = originalTask.clone()

                print("Enter the new priority for the cloned Task (current priority: \(clonedTask.priority)):")
                if let newPriorityString = userInput.getInput() {
                    let newPriority = TaskPriority(rawValue: newPriorityString.lowercased())
                    clonedTask.priority = newPriority ?? .low
                    manager.addWork(workItem: clonedTask)
                    print("Task cloned successfully with a new ID and priority.")
                }
            }
            else {
                print("Task with ID \(taskID) not found.")
            }
        }
        else {
            print("Invalid Task ID. Please enter a valid ID.")
        }
    }
    
    func cloneLabWork() {
        print("Enter the ID of the Lab Work you want to clone:")
        if let labWorkID = userInput.toInt() {
            if let originalLabWork = manager.getWorkByID(ID: labWorkID) as? LabWork {
                let clonedLabWork = originalLabWork.clone()

                print("Enter the new end date for the cloned Lab Work (current end date: \(clonedLabWork.endDate)):")
                if let newEndDate = userInput.getInput() {
                    clonedLabWork.endDate = newEndDate
                    manager.addWork(workItem: clonedLabWork)
                    print("Lab Work cloned successfully with a new ID and end date.")
                }
            }
            else {
                print("Lab Work with ID \(labWorkID) not found.")
            }
        }
        else {
            print("Invalid Lab Work ID. Please enter a valid ID.")
        }
    }
}
