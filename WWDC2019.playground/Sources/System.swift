import Foundation
public class System{
    public var agent = " "
    public var superhero = " "
    private var moneo: Moneo
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
