import Foundation

class File: FileSystemItem {
    let adapter: FileAdapter

    init(name: String, adapter: FileAdapter) {
        self.adapter = adapter
        super.init(name: name)
    }
}

