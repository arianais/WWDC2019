//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).

import Foundation
public class System{
    //MARK: Variables
    public var agent = " "
    public var superhero = " "
    private var moneo: Moneo
    //MARK: Init
    public init(){
        self.moneo = Moneo()
    }
    public func saveProject(_ project: Moneo){
        self.moneo = project
        self.moneo.ui.superhero = self.superhero
        self.moneo.ui.agent = self.agent
        self.moneo.ui.setTitlePage()
    }
}
