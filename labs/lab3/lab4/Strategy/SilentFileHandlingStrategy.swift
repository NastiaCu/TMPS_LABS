import Foundation

class SilentFileHandlingStrategy: FileHandlingStrategy {
    func handleFileAction(action: String, file: String) {
        print("Log message: Action: '\(action)' on file '\(file)' was saved.")
    }
}
