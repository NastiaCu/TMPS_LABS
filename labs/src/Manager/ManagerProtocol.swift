import Foundation

protocol ManagerProtocol {
    func addWork(workItem: WorkItemProtocol)
    func getWorkByID(ID: Int) -> WorkItemProtocol?
    func getAllWorks() -> [WorkItemProtocol]
    func removeWork(workItem: WorkItemProtocol)
}
