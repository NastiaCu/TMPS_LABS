import Foundation

protocol FileSystemImplementation {
    func createFileAdapter() -> FileAdapter
}
