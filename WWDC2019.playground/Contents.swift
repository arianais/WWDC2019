/*:
 # Moneo
 - Note:
 **This playground was created to teach budding creators how to code and design technology with meaningful social impact by creating chat bot that refers people in mental health crises to local support resources.** Using the creative problem solving and CoreML, students are taught how to use cutting-edge technology to adress problems and create change within their own communities.

## Understanding the Problem
This is a story of a creator who woke up one day and opened up their laptop disatisfied with the world around them. They saw people around them
 
 ## Defining
 This is a story of a creator who woke up one day and opened up their laptop disatisfied with the world around them. They saw people around them
 
 ## Ideating & Selecting
 This is a story of a creator who woke up one day and opened up their laptop disatisfied with the world around them. They saw people around them
 
 ## Implement
 This is a story of a creator who woke up one day and opened up their laptop disatisfied with the world around them. They saw people around them
 
 ## Evaluate
 This is a story of a creator who woke up one day and opened up their laptop disatisfied with the world around them. They saw people around them

 
 ### Pilot, take the keyboard!
 1. First, start up the rocket's engine by calling `rocket.startEngine()`.
 - Example:
 `rocket.startEngine()`
 */
import CoreML


let model = CrisisClassifier()

let moneo = Moneo()
moneo.primarySuicideResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.secondarySuicideResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.primaryAbuseResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.secondaryAbuseResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.primaryMentalHealthResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.secondaryMentalHealthResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.primaryCrisisResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
moneo.secondaryCrisisResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")

func classify(_ text: String) -> Classification? {
    do {
        let prediction = try model.prediction(text: text)
        switch prediction.featureValue(for: "label") {
        case MLFeatureValue(string: "harm self"):
            return .harmSelf
        case MLFeatureValue(string: "harm others"):
            return .harmOthers
        case MLFeatureValue(string: "harm poster"):
            return .harmUser
        default:
            return .other
        }
    } catch {
        print(error)
        return nil
    }
    
}

func findResources(_ text: String) -> [Resource] {
    switch classify(text) {
    case .harmSelf?:
        return [moneo.primarySuicideResource, moneo.secondarySuicideResource]
    case .harmOthers?:
         return [moneo.primaryMentalHealthResource, moneo.secondaryMentalHealthResource]
    case .harmUser?:
        return [moneo.primaryAbuseResource, moneo.secondaryAbuseResource]
    case .other?:
        return [moneo.primaryCrisisResource, moneo.secondaryCrisisResource]
    default:
        return []
    }
 
    
}
func createConversation(_ text: String) -> [Message]{
    var messages = [Message]()
    let starterMessage = Message(text: "Hi! How are you today?", title: nil, sender: .moneo, classification: nil)
    messages.append(starterMessage)
    messages.append(Message(text: text, title: nil, sender: .user, classification: classify(text)))
    for resource in findResources(text){
        messages.append(Message(text: resource.contactInfo, title: resource.name, sender: .moneo, classification: nil))
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
