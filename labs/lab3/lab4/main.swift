import Foundation

let fileManager = FileManager()
let verboseLoggingStrategy = VerboseFileHandlingStrategy()
let silentLoggingStrategy = SilentFileHandlingStrategy()
let client1 = FileManagerClient(fileManager: fileManager, fileHandlingStrategy: verboseLoggingStrategy)
let client2 = FileManagerClient(fileManager: fileManager, fileHandlingStrategy: silentLoggingStrategy)

let createFileCommand = CreateFileCommand(fileManager: fileManager, filename: "example.txt")
let createFileCommand2 = CreateFileCommand(fileManager: fileManager, filename: "example2.txt")


client1.executeCommand(command: createFileCommand)
client1.changeState(newState: InactiveState())

client2.executeCommand(command: createFileCommand2)


let deleteFileCommand = DeleteFileCommand(fileManager: fileManager, filename: "example.txt")
let deleteFileCommand2 = DeleteFileCommand(fileManager: fileManager, filename: "example2.txt")

client1.executeCommand(command: deleteFileCommand)
client2.executeCommand(command: deleteFileCommand2)
