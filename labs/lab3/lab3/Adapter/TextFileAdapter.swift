import Foundation

class TextFileAdapter: FileAdapter {
    private var text: String = ""
    
    func read() -> String {
        return text
    }
    
    func write(content: String) {
        text = content
    }
}
