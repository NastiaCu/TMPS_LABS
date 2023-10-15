import Foundation

class ConcreteFileSystem: FileSystem {
    var implementation: FileSystemImplementation
    
    init(implementation: FileSystemImplementation) {
        self.implementation = implementation
    }
    
    func readFile(file: String) -> String {
        let fileAdapter = implementation.createFileAdapter()
        return fileAdapter.read()
    }
    
    func writeFile(file: String, content: String) {
        let fileAdapter = implementation.createFileAdapter()
        fileAdapter.write(content: content)
    }
}
