import Foundation

class Directory: FileSystemItem {
    var items: [FileSystemItem] = []

    func addItem(item: FileSystemItem) {
        items.append(item)
    }

    func listItems() {
        print("Contents of directory \(name):")
        for item in items {
            print(item.name)
        }
    }
}
