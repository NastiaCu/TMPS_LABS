import Foundation

class PDFFileAdapter: FileAdapter {
    private var pdfData: Data = Data()
    
    func read() -> String {
        return "Text content extracted from PDF"
    }
    
    func write(content: String) {
        pdfData = Data()
    }
}
