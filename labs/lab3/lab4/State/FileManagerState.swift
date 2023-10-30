import Foundation

protocol FileManagerState {
    func performAction(fileManager: FileManager, action: String, file: String)
}
