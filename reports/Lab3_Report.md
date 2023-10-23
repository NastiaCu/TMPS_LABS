# Topic: Structural Design Patterns

### Author: Anastasia Cunev
---
## Theory
Structural design patterns are a category of design patterns that focus on the composition of classes and objects to form larger structures and systems. They provide a way to organize objects and classes in a way that is both flexible and efficient, while allowing for the reuse and modification of existing code. Structural design patterns address common problems encountered in the composition of classes and objects, such as how to create new objects that inherit functionality from existing objects, how to create objects that share functionality without duplicating code, or how to define relationships between objects in a flexible and extensible way.

Some examples of from this category of design patterns are:

   * Adapter
   * Bridge
   * Composite
   * Decorator
   * Facade
   * Flyweight
   * Proxy
   

## Objectives:

1. Study and understand the Structural Design Patterns.
2. As a continuation of the previous laboratory work, think about the functionalities that your system will need to provide to the user.
3. Implement some additional functionalities, or create a new project using structural design patterns.
   
## Implementation description

### Adapter Desing Pattern 
The `Adapter` pattern allows us to adapt different file formats into a common interface. Example: the `FileAdapter` protocol and its concrete implementations, `TextFileAdapter` and `PDFFileAdapter`.

```swift
protocol FileAdapter {
    func read() -> String
    func write(content: String)
}

class TextFileAdapter: FileAdapter {
    private var text: String = ""
    
    func read() -> String {
        return text
    }
    
    func write(content: String) {
        text = content
    }
}

class PDFFileAdapter: FileAdapter {
    private var pdfData: Data = Data()
    
    func read() -> String {
        return "Text content extracted from PDF"
    }
    
    func write(content: String) {
        pdfData = Data()
    }
}
```
### Bridge Design Pattern
The `Bridge` pattern separates the high-level `FileSystem` from the low-level `FileSystemImplementation`.
```swift
protocol FileSystemImplementation {
    func createFileAdapter() -> FileAdapter
}

class LocalFileSystem: FileSystemImplementation {
    func createFileAdapter() -> FileAdapter {
        return TextFileAdapter()
    }
}

class RemoteFileSystem: FileSystemImplementation {
    func createFileAdapter() -> FileAdapter {
        return PDFFileAdapter()
    }
}
```
### Composite Design Pattern
The `Composite` pattern is applied through the `Directory`, `File`, and `FileSystemItem` classes, allowing us to represent a file system with nested directories and files.

```swift
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

class File: FileSystemItem {
    let adapter: FileAdapter

    init(name: String, adapter: FileAdapter) {
        self.adapter = adapter
        super.init(name: name)
    }
}

class FileSystemItem {
    let name: String

    init(name: String) {
        self.name = name
    }
}
```
### Decorator Design Pattern
The `Decorator` pattern allows us to dynamically enhance the behavior of the `FileAdapter`. The `FileDecorator` class adds additional information to the content read.
```swift
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
```

## Conclusion 
For this laboratory work I implemented 4 design patterns: `Adapter`, `Bridge`, `Composite` and `Decorator`. These design patterns help to improve the logic of the project and to organize everything in such a way that it will be easier to maintain as the project grows and extends.