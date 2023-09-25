import Foundation

class UserInputManager{
    
    private let pdfReportGenerator: ReportGeneratorProtocol

    init(pdfReportGenerator: ReportGeneratorProtocol) {
        self.pdfReportGenerator = pdfReportGenerator
    }
    
    func getInput() -> String?{
        return readLine()
    }
    
    func toInt() -> Int?{
        if let input = getInput(), let intInput = Int(input){
            return intInput
        }
        return nil
    }
    
    func getTaskDetails() -> (Int, String, String, TaskPriority)? {
        print("Enter Task ID:")
        if let taskID = toInt() {
            print("Enter Task Title:")
            if let title = getInput(), !title.isEmpty {
                print("Enter Task Description:")
                if let description = getInput() {
                    print("Enter Task Priority (low/medium/high):")
                    if let priorityString = getInput(),
                       let priority = TaskPriority(rawValue: priorityString.lowercased()) {
                        return (taskID, title, description, priority)
                    } else {
                        print("Invalid priority. Please enter 'low', 'medium', or 'high'.")
                    }
                }
            }
        }
        return nil
    }
    
    func getLabWorkDetails() -> (Int, String, String, String, String)? {
        print("Enter Lab Work ID:")
        if let labWorkID = toInt() {
            print("Enter Lab Work Title:")
            if let title = getInput(), !title.isEmpty {
                print("Enter Lab Work Description:")
                if let description = getInput() {
                    print("Enter Lab Work Start Date:")
                    if let startDate = getInput(){
                        print("Enter Lab Work End Date:")
                        if let endDate = getInput(){
                            return (labWorkID, title, description, startDate, endDate)
                        }
                    }
                }
            }
        }
        return nil
    }
}
