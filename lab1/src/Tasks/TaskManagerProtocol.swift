import Foundation

protocol TaskManagerProtocol {
    func addTask(task: TaskProtocol)
    func getTaskByID(taskID: Int) -> TaskProtocol?
    func getAllTasks() -> [TaskProtocol]
    func removeTask(task: TaskProtocol)
}