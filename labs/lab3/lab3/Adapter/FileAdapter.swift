import Foundation

protocol FileAdapter {
    func read() -> String
    func write(content: String)
}


