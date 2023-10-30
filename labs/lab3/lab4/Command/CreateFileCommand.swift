import Foundation

class CreateFileCommand: FileOperation {
    private let fileManager: FileManager
    private let filename: String
    
    init(fileManager: FileManager, filename: String) {
        self.fileManager = fileManager
        self.filename = filename
    }
    
    func execute() {
        fileManager.performAction(action: "Create", file: filename)
    }
}
