import Foundation

class InactiveState: FileManagerState {
    func performAction(fileManager: FileManager, action: String, file: String) {
        print("FileManager is in the inactive state. Action '\(action)' on file '\(file)' is not allowed.")
    }
}
