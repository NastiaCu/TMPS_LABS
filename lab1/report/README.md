# Topic: SOLID Principles

### Author: Anastasia Cunev
---
## Theory
**SOLID Principles:**
1. Single Responsibility Principle
2. Open-Closed Principle
3. Liskov Substitution Principle
4. Interface Segregation Principle
5. Dependency Inverersion Principle

SOLID is a set of five object-oriented design principles intended to make software designs more maintainable, flexible, and easy to understand. The acronym stands for Single Responsibility Principle, Open-Closed Principle, Liskov Substitution Principle, Interface Segregation Principle, and Dependency Inversion Principle. Each principle addresses a specific aspect of software design, such as the organization of responsibilities, the handling of dependencies, and the design of interfaces. By following these principles, software developers can create more modular, testable, and reusable code that is easier to modify and extend over time. These principles are widely accepted and adopted in the software development community and can be applied to any object-oriented programming language.

## Objectives:

1. Study and understand the SOLID Principles.
2. Choose a domain, define its main classes/models/entities and choose the appropriate instantiation mechanisms.
3. Create a sample project that respects SOLID Principles.
   
## Implementation description

### Single Responsibility Principle
In my project, the `PDFReportGenerator` class has a single responsibility: generating PDF reports. It doesn't handle user input or manage work items, which are handled by other classes (`UserInputManager` and `Manager`), which makes the code more readable and easy to maintain.
```swift
class PDFReportGenerator: ReportGeneratorProtocol{
    
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

    //rest of the code 
}
```
### Open-Closed Principle
I've designed my code so that it's open for extension but closed for modification. For example, I can easily add new work items like tasks and lab works without modifying the existing classes. For example, I can easily add new `workItem` types without modifying the `WorkItemProtocol` or other existing classes.
```swift
protocol WorkItemProtocol{
    var ID: Int { get set }
    var title: String { get set }
    var description: String { get set }
}

class Task: WorkItem, TaskProtocol {
    var priority: TaskPriority

    init(ID: Int, title: String, description: String, priority: TaskPriority) {
        self.priority = priority
        super.init(ID: ID, title: title, description: description)
    }
}
```
### Liskov Substitution Principle
The LSP ensures that derived classes can be substituted for their base classes without affecting program correctness. In my code, I have `Task` and `LabWork` classes derived from `WorkItem`, and they can be used interchangeably where `WorkItem` is expected.

```swift
class WorkItem : WorkItemProtocol{
    var ID: Int
    var title: String
    var description: String
    
    init(ID: Int, title: String, description: String){
        self.ID = ID
        self.title = title
        self.description = description
    }
}


class LabWork: WorkItem, LabWorkProtocol {
    var startDate: String
    var endDate: String

    init(ID: Int, title: String, description: String, startDate: String, endDate: String) {
        self.startDate = startDate
        self.endDate = endDate
        super.init(ID: ID, title: title, description: description)
    }
}

class Task: WorkItem, TaskProtocol {
    var priority: TaskPriority

    init(ID: Int, title: String, description: String, priority: TaskPriority) {
        self.priority = priority
        super.init(ID: ID, title: title, description: description)
    }
}
```
### Interface Segregation Principle
To acheive the ISP in my project, `Task` and `LabWork` classes implement only the required properties and methods specific to their roles. 
```swift
protocol TaskProtocol {
    var priority: TaskPriority { get set }
}

class Task: WorkItem, TaskProtocol {
    var priority: TaskPriority

    init(ID: Int, title: String, description: String, priority: TaskPriority) {
        self.priority = priority
        super.init(ID: ID, title: title, description: description)
    }
}
```
### Dependency Inverersion Principle
I've implemented DIP by introducing protocols (`ReportGeneratorProtocol`, `TaskProtocol`, `LabWorkProtocol`, `WorkItemProtocol`, `ManagerProtocol`) that serve as abstractions. These protocols allow for dependency inversion because higher-level modules (e.g., `Manager` and `PDFReportGenerator`) depend on these abstractions rather than concrete implementations. 
```swift
let reportGenerator: ReportGeneratorProtocol = PDFReportGenerator()
let manager: ManagerProtocol = Manager(userInputManager: userInput)
```
## Conclusion 
For this laboratory work I implemented the SOLID principles in the `Tasks and Lab Works Management System`. The SOLID principles help to acheive clean design that can be easily adapted to future changes and additions with minimal modifications.