import Foundation

class LocalFileSystem: FileSystemImplementation {
    func createFileAdapter() -> FileAdapter {
        return TextFileAdapter()
    }
}
