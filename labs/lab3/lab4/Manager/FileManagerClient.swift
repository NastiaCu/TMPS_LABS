import Foundation

class FileManagerClient: FileManagerObserver {
    private let fileManager: FileManager
    private var fileHandlingStrategy: FileHandlingStrategy
    private var state: FileManagerState = ActiveState()
    
    init(fileManager: FileManager, fileHandlingStrategy: FileHandlingStrategy) {
        self.fileManager = fileManager
        self.fileHandlingStrategy = fileHandlingStrategy
        self.fileManager.addObserver(self)
    }
    
    func update(action: String, file: String) {
        fileHandlingStrategy.handleFileAction(action: action, file: file)
    }
    
    func changeState(newState: FileManagerState) {
        self.state = newState
    }
    
    func executeCommand(command: FileOperation) {
        if state is ActiveState {
            state.performAction(fileManager: fileManager, action: "Command", file: "N/A")
            command.execute()
        } else {
            print("FileManager is in the inactive state. Action 'Command' on file 'N/A' is not allowed.")
        }
    }
}


