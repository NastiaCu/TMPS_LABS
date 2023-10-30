//import Foundation
//
//let localFileSystemImplementation = LocalFileSystem()
//let remoteFileSystemImplementation = RemoteFileSystem()
//
//let localFileSystem = ConcreteFileSystem(implementation: localFileSystemImplementation)
//let remoteFileSystem = ConcreteFileSystem(implementation: remoteFileSystemImplementation)
//
//localFileSystem.readFile(file: "document.txt")
//localFileSystem.writeFile(file: "new_file.txt", content: "Hello, this is a new file!")
//
//remoteFileSystem.readFile(file: "document.pdf")
//remoteFileSystem.writeFile(file: "new_file.pdf", content: "This is a PDF document.")
//
//let rootDirectory = Directory(name: "Root")
//let subDirectory = Directory(name: "SubDirectory")
//
//let file1 = File(name: "file1.txt", adapter: TextFileAdapter())
//let file2 = File(name: "file2.txt", adapter: PDFFileAdapter())
//
//subDirectory.addItem(item: file1)
//subDirectory.addItem(item: file2)
//
//rootDirectory.addItem(item: subDirectory)
//
//rootDirectory.listItems()
//
//let textFileAdapter = TextFileAdapter()
//let decoratedFile = FileDecorator(fileAdapter: textFileAdapter, additionalInfo: "This file contains important data.")
//
//decoratedFile.write(content: "This is a secret message.")
//let decoratedContent = decoratedFile.read()
//print("Decorated Content: \(decoratedContent)")
