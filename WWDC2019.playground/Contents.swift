import UIKit
import CoreML


let model = CrisisClassifier()

let moneo = Moneo()
//moneo.primarySuicideResource = Resource(name: "", contactInfo: "")

func findResources(_ text: String) -> [Resource] {
    do {
        let prediction = try model.prediction(text: text)
        switch prediction.featureValue(for: "label") {
        case MLFeatureValue(string: "harm self"):
            return [moneo.primarySuicideResource, moneo.secondarySuicideResource]
        case MLFeatureValue(string: "harm others"):
             return [moneo.primaryMentalHealthResource, moneo.secondaryMentalHealthResource]
        case MLFeatureValue(string: "harm poster"):
             return [moneo.primaryAbuseResource, moneo.secondaryAbuseResource]
        default:
             return [moneo.primaryCrisisResource, moneo.secondaryCrisisResource]
        }
    } catch {
        print(error)
        return []
    }
    
}
func createConversation(_ text: String) -> [Message]{
    var messages = [Message]()
    let starterMessage = Message(text: "Hi! How are you today?", resource: nil, sender: .moneo)
    messages.append(starterMessage)
    messages.append(Message(text: text, resource: nil, sender: .user))
    for resource in findResources(text){
        messages.append(Message(text: resource.name, resource: resource.contactInfo, sender: .moneo))
    }
    return messages
}

let conversation1 = createConversation(moneo.test1)
moneo.displayConversation(conversation1)

let conversation2 = createConversation(moneo.test2)
moneo.displayConversation(conversation2)

let conversation3 = createConversation(moneo.test3)
moneo.displayConversation(conversation3)

let conversation4 = createConversation(moneo.test4)
moneo.displayConversation(conversation4)
