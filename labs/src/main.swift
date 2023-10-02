import Foundation

let reportGenerator: ReportGeneratorProtocol = PDFReportGenerator()
let userInput = UserInputManager(pdfReportGenerator: reportGenerator)
let manager = Manager.shared
let menu: Menu = Menu(pdfReportGenerator: reportGenerator)


menu.mainMenu(manager: manager, userInput: userInput )
