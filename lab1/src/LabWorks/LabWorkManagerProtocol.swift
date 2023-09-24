import Foundation

protocol LabWorkManagerProtocol {
    func addLabWork(labWork: LabWorkProtocol)
    func getLabWorkByID(labWorkID: Int) -> LabWorkProtocol?
    func getAllLabWorks() -> [LabWorkProtocol]
    func removeLabWork(labWork: LabWorkProtocol)
}