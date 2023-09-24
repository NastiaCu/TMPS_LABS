import Foundation

class TaskManager: TaskManagerProtocol{
    private var tasks: [TaskProtocol] = []


    func addTask(task: TaskProtocol){
        tasks.append(task)
    }

    func getTaskByID(taskID: Int) -> TaskProtocol?{
        return tasks.first { $0.taskID == taskID }
    }

    func getAllTasks() -> [TaskProtocol] {
        return tasks
    }

    func removeTask(task: TaskProtocol){
        if let index = tasks.firstIndex(where: { $0.taskID == task.taskID }) {
            tasks.remove(at: index)
        }
    }
}