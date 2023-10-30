import Foundation

class VerboseFileHandlingStrategy: FileHandlingStrategy {
    func handleFileAction(action: String, file: String) {
        print("Verbose Logging: Action '\(action)' performed on file '\(file)'.")
    }
}
