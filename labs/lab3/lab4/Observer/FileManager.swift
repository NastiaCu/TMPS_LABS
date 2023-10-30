import Foundation

class FileManager {
    private var observers = [FileManagerObserver]()
    
    func addObserver(_ observer: FileManagerObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: FileManagerObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func performAction(action: String, file: String) {
        print("FileManager: Performing action '\(action)' on file '\(file)'.")
        notifyObservers(action: action, file: file)
    }
    
    private func notifyObservers(action: String, file: String) {
        for observer in observers {
            observer.update(action: action, file: file)
        }
    }
}
