//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).

import Foundation
public class Moneo {
    //MARK: Resource Variables
    public var suicideResource = Resource(name: "", contactInfo: "")
    public var mentalHealthResource = Resource(name: "", contactInfo: "")
    public var domesticViolenceResource = Resource(name: "", contactInfo: "")
    public var sexualAssaultResource = Resource(name: "", contactInfo: "")
    public var primaryCrisisResource = Resource(name: "", contactInfo: "")
    public var secondaryCrisisResource = Resource(name: "", contactInfo: "")
    //MARK: Test Variables
    public let test1 = "I feel empty. All I want to do is disappear and never come back."
    public let test2 =  "i feel like im going bonkers at my parents’ house because they’re so transphobic and abusive and i can’t take this anymore"
    public let test3 = "I'm feeling okay. Not that great though."
    //MARK: Other variables
    public var ui = UI()
    
    //MARK: Init
    public init(){
    }
    //display conversation: displays test chatbot conversation
    public func displayConversation(_ messages: [Message]){
        ui.messages.append(messages)
    }
}
//MARK: Structs
//Message: struct for chatbot messages
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
//Classification: struct for the CoreML model's output's classifications
public enum Classification{
    case harmSelf
    case harmUser
    case other
}
//Sender: stuct of chatbot message senders
public enum Sender{
    case user
    case moneo
}
//Resource: struct for chatbot resources
public struct Resource {
    public var name: String
    public var contactInfo: String
    public init(name: String, contactInfo: String){
        self.name = name
        self.contactInfo = contactInfo
    }
}

