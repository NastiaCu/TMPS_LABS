import Foundation

protocol FileSystem {
    var implementation: FileSystemImplementation { get set }
    
    func readFile(file: String) -> String
    func writeFile(file: String, content: String)
}
