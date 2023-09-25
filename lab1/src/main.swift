import Foundation

let reportGenerator: ReportGeneratorProtocol = PDFReportGenerator()
let userInput = UserInputManager(pdfReportGenerator: reportGenerator)
let manager: ManagerProtocol = Manager(userInputManager: userInput)
let menu: Menu = Menu(pdfReportGenerator: reportGenerator)


menu.mainMenu(manager: manager as! Manager, userInput: userInput )
