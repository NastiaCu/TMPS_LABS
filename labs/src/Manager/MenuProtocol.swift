import Foundation

protocol MenuProtocol{
    func mainMenu(manager: ManagerProtocol, userInput: UserInputManager)
    func addTask()
    func addLabWork()
    func cloneLabWork()
}
