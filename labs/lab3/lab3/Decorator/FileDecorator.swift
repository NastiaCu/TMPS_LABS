import Foundation

class FileDecorator: FileAdapter {
    private let fileAdapter: FileAdapter
    private let additionalInfo: String

    init(fileAdapter: FileAdapter, additionalInfo: String) {
        self.fileAdapter = fileAdapter
        self.additionalInfo = additionalInfo
    }

    func read() -> String {
        let content = fileAdapter.read()
        return "\(content)\nAdditional Info: \(additionalInfo)"
    }

    func write(content: String) {
        fileAdapter.write(content: content)
    }
}
