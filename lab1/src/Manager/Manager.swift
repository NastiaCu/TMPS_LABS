import Foundation

class Manager: ManagerProtocol{
    
    private var items: [WorkItemProtocol] = []
    private let userInputManager: UserInputManager

    init(userInputManager: UserInputManager) {
        self.userInputManager = userInputManager
    }
    
    func addWork(workItem: WorkItemProtocol) {
        items.append(workItem)
    }
    
    func getWorkByID(ID: Int) -> WorkItemProtocol? {
        return items.first { $0.ID == ID}
    }
    
    func getAllWorks() -> [WorkItemProtocol] {
        return items
    }
    
    func removeWork(workItem: WorkItemProtocol) {
        if let index = items.firstIndex(where: { $0.ID == workItem.ID }){
            items.remove(at: index)
        }
    }
}
