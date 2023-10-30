import Foundation

protocol FileManagerObserver: AnyObject {
    func update(action: String, file: String)
}
