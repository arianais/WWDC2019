import Foundation
public class Moneo {
    public var suicideResource = Resource(name: "", contactInfo: "")
    public var mentalHealthResource = Resource(name: "", contactInfo: "")
    public var domesticViolenceResource = Resource(name: "", contactInfo: "")
    public var sexualAssaultResource = Resource(name: "", contactInfo: "")
    public var primaryCrisisResource = Resource(name: "", contactInfo: "")
    public var secondaryCrisisResource = Resource(name: "", contactInfo: "")
    
    public let test1 = "I feel empty. All I want to do is disappear and never come back."
    public let test2 =  "i feel like im going bonkers at my parents’ house because they’re so transphobic and abusive and i can’t take this anymore"
    public let test3 = "I'm feeling pretty good. Better than yesterday."
    
    public var ui = UI()
    public init(){
  
    }
    public func displayConversation(_ messages: [Message]){
        ui.messages.append(messages)
    }
}

public struct Message{
    public var text: String
    public var title: String?
    public var sender: Sender
    public var classification: Classification?
    public init(text: String, title: String?, sender: Sender, classification: Classification?) {
        self.text = text
        self.title = title
        self.sender = sender
        self.classification = classification
    }
}

public struct msg{
    public var text: String
    public var resource: String?
    public var sender: Sender
    public init(text: String, resource: String?, sender: Sender) {
        self.text = text
        self.resource = resource
        self.sender = sender
    }
}
public enum Classification{
    case harmSelf
    case harmUser
    case other
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

