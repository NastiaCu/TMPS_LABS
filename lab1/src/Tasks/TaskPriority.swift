import Foundation

enum TaskPriority{
    case low
    case medium
    case high
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "low":
            self = .low
        case "medium":
            self = .medium
        case "high":
            self = .high
        default:
            return nil
        }
    }
}
