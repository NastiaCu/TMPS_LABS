import Foundation

class RemoteFileSystem: FileSystemImplementation {
    func createFileAdapter() -> FileAdapter {
        return PDFFileAdapter()
    }
}
