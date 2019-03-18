import Foundation
public class Moneo {
    public var primarySuicideResource = Resource(name: "", contactInfo: "")
    public var secondarySuicideResource = Resource(name: "", contactInfo: "")
    public var primaryAbuseResource = Resource(name: "", contactInfo: "")
    public var secondaryAbuseResource = Resource(name: "", contactInfo: "")
    public var primaryMentalHealthResource = Resource(name: "", contactInfo: "")
    public var secondaryMentalHealthResource = Resource(name: "", contactInfo: "")
    public var primaryCrisisResource = Resource(name: "", contactInfo: "")
    public var secondaryCrisisResource = Resource(name: "", contactInfo: "")
    
    public let test1 = "I feel empty, and I want to kill myself more than I have in a while but I don't have the energy. All I want to do is disappear and never come back."
    public let test2 =  "I’m going bonkers at my parents’ house because they’re so transphobic and abusive and I can’t take this anymore."
    public let test3 = "I have these fantasies of just killing or torturing those who have wronged me or others, it feels good to think about..."
    public let test4 = "I'm feeling okay, but not that great though."
    
    private var ui = UI()
    public init(){
  
    }
    public func displayConversation(_ messages: [Message]){
        
    }
}

public struct Message{
    public var text: String
    public var resource: String?
    public var sender: Sender
    public init(text: String, resource: String?, sender: Sender) {
        self.text = text
        self.resource = resource
        self.sender = sender
    }
}
public enum Sender{
    case user
    case moneo
}
public struct Resource {
    public var name: String
    public var contactInfo: String
    public init(name: String, contactInfo: String){
        self.name = name
        self.contactInfo = contactInfo
    }
}

