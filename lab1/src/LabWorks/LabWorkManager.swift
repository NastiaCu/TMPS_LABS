import Foundation

class LabWorkManager: LabWorkManagerProtocol{
    private var labWorks: [LabWorkProtocol] = []


    func addLabWork(labWork: LabWorkProtocol){
        labWorks.append(labWork)
    }

    func getLabWorkByID(labWorkID: Int) -> LabWorkProtocol?{
        return labWorks.first { $0.labWorkID == labWorkID }
    }

    func getAllLabWorks() -> [LabWorkProtocol] {
        return labWorks
    }

    func removeLabWork(labWork: LabWorkProtocol){
        if let index = labWorks.firstIndex(where: { $0.labWorkID == labWork.labWorkID }) {
            labWorks.remove(at: index)
        }
    }
}