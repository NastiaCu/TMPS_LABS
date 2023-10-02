import Foundation

class WorkItem : WorkItemProtocol{
    var ID: Int
    var title: String
    var description: String
    
    init(ID: Int, title: String, description: String){
        self.ID = ID
        self.title = title
        self.description = description
    }
}
