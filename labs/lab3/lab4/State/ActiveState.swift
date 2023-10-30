import Foundation

class ActiveState: FileManagerState {
    func performAction(fileManager: FileManager, action: String, file: String) {
        fileManager.performAction(action: action, file: file)
    }
}
