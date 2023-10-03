# Topic: Creational Design Patterns

### Author: Anastasia Cunev
---
## Theory
Creational design patterns are a category of design patterns that focus on the process of object creation. They provide a way to create objects in a flexible and controlled manner, while decoupling the client code from the specifics of object creation. Creational design patterns address common problems encountered in object creation, such as how to create objects with different initialization parameters, how to create objects based on certain conditions, or how to ensure that only a single instance of an object is created. There are several creational design patterns that have their own strengths and weaknesses. Each of it is best suited for solving specific problems related to object creation. By using creational design patterns, developers can improve the flexibility, maintainability, and scalability of their code.

Some examples of this kind of design patterns are:

   * Singleton
   * Builder
   * Prototype
   * Object Pooling
   * Factory Method
   * Abstract Factory
   

## Objectives:

1. Study and understand the Creational Design Patterns.
2. Choose a domain, define its main classes/models/entities and choose the appropriate instantiation mechanisms.
3. Use some creational design patterns for object instantiation in a sample project.
   
## Implementation description

### Builder Desing Pattern 
In my project, I made the `WorkItemBuilder` class which is used to build the `Task` and `LabWork` object. It helps to separate the construction of a complex object from its representation so that the same construction process can create different representations. It is used to construct a complex object step by step and the final step will return the object.
```swift
class WorkItemBuilder {
    public var ID: Int?
    public var title: String?
    public var description: String?
    public var startDate: String?
    public var endDate: String?
    public var priority: TaskPriority?
    
    init(title: String) {
        self.title = title;
    }

    func ID(_ ID: Int) -> WorkItemBuilder {
        self.ID = ID
        return self
    }
    //rest of the code 
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
```
### Factory Design Pattern
I also implemented the Factory pattern, which helps to create the different objects with different attributes.
```swift
class TaskFactory {
    func createTask(builder: WorkItemBuilder) -> Task? {
        return Task(builder: builder)
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
```
### Prototype Design Pattern
The `Prototype pattern` is used to clone the objects using a prototype. For my laboratory work I implemented it in such a way thast it will help cloning the object and change it's properties.

```swift
func clone() -> Self {
    let labWorkCopy = LabWork(builder: WorkItemBuilder(title: self.title))
    labWorkCopy.ID = self.ID + 1
    labWorkCopy.description = self.description
    labWorkCopy.startDate = self.startDate
    labWorkCopy.endDate = self.endDate
    return labWorkCopy as! Self
}
```
### Singletone Design Pattern
`Singleton pattern` is useful when we want to ensure that there is created only one instance of a class to prevent the data loss. For my project, I implemented the `Singleton pattern` in the `Manager` class, because this class stores a list of `Tasks` and `Lab Works` and we don't want to have separate lists in different class objects.
```swift
static let shared = Manager()
Manager.shared.addWork(workItem: labWork)
let manager = Manager.shared
```

## Conclusion 
For this laboratory work I implemented 4 design patterns: `Builder`, `Factory`, `Singleton` and `Prototype`. These design patterns help to improve the logic of the project and to organize everything in such a way that it will be easier to maintain as the project grows and extends.