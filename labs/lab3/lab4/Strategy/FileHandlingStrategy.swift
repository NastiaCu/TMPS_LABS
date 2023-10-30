import Foundation

protocol FileHandlingStrategy {
    func handleFileAction(action: String, file: String)
}
