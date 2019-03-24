import CoreML
let system  = System()
/*:
 # The Moneo Mission
 - Note:
 **This playground was created to teach budding creators how to code and design technology with meaningful social impact by creating a chatbot that refers people in mental health crises to support resources.** Using creative problem solving, students are taught how to use technologies like Machine Learning to address problems and affect change for their communities.
 
 ## Congratulations!
 You have been chosen to become an Appvenger. The Appvengers are a secret team of elite technical superheroes determined to use their powers to improve the world with technology. But, before you become an official superhero, you must decide on your name and undergo superhero training.
 
 ## Before your training begins…
 1. Make sure you've added a picture of yourself to the "Resources" folder named `agent.png` so that the other agents can identify you. This picture should contain a clear picture of your face (and no other faces), such as a school yearbook photo.
 * Callout(Sample Photos):
 ![Photo of Sample Photos](Images/examples.png)
 2. Enter your first name into the Appvenger’s system to verify your identity by making `system.agent` equivalent to a string of your name.
 - Example:
 ```
 system.agent = “Ari”
 ```
 */

/*:
 3. Add your superhero name into the Appvenger’s system by making `system.superhero` equivalent to a string of your new superhero name.
 - Example:
 ```
 system.superhero = “Fire Pixel”
 ```
 */

/*:
 ## Top Secret Information
 Your training will be centered around the Appvenger’s creative problem solving process, a secret toolkit the Appvengers use for their missions. This five stage process will guide you through evaluating problems in your community and using your powers for meaningful change.
 * Callout(Mission):
 During this training session, you will be tasked with creating a technological solution to help those in mental health crises.
 
 ### Stage 1: Understand & Research
 In this stage, Appvengers review the guidelines and suggestions for their assigned mission. They then interview experts relevant to the topics the mission addresses. We have included a sample interview with a mental health expert below
 
 ***Interview***
 1. **What is an example of a mental health crisis?** You’re getting ready to meet up with your friend Jill when she tells you she has to bail. You ask, “Is something wrong?” She responds, “Just not feeling life today.” You tell Jill you are coming over to her house, where you find Jill crying. She tells you, “Life is too hard.”
 2. **How should you help people in these events?** First, practice clear communication -- it is essential they feel heard and understood and use an empathetic, non-judgmental tone. Second, reach out for help. If you feel that you are not able to de-escalate the person in crisis without additional support, call someone or connect the individual with a crisis resource.
 *(information via the National Alliance on Mental Health)*
 
 In the interview, the expert said a possible solution in these situations is connecting an individuals in crisis to mental health resources. Research and find 1 local hotline or textline that supports individuals experiencing each of the following: suicide, mental illness, sexual assault, domestic violence, crisis, and a crisis issue of your choice. After, set the following variables to equal these resources: `suicideResource`, `mentalHealthResource`, `domesticViolenceResource`, `sexualAssaultResource`, `primaryCrisisResource`, and `secondaryCrisisResource`.
 - Example:
 ```
 let suicideResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
 ```
 */

/*:
 ## Stage 2: Ideate & Select
 In this stage, Appvengers go through possible solutions to the problem they are addressing and decide on a solution they want to proceed with. Although this is an invaluable step, we have chosen to go with one solution to simplify your training.
 * Callout(Project):
 In this mission, you will be creating a prototype of a chatbot named Moneo that connects users to in crisis to mental health resources. Moneo will be powered by a machine learning model that classifies messages sent by the user and decides if the user is likely to hurt themselves or if someone is hurting them. If Moneo identifies that the user might be classified into one of the following, Moneo sends two local textlines or hotlines that might be able to help the user.
 
 ## Stage 3: Planning & Building
 In this stage, agents usually draw or craft a mockup or a sketch of what their technological solution will look like. We’ve created one below as an example.
 * Callout(Mockup):
 ![Photo of Sample Photos](Images/mockup.png)
 
 Next, it is time to put this plan into action. First, we've define a `moneo` variable and set it equal to an instance of the `Moneo` class to create the Moneo chatbot.
 */
let moneo = Moneo()
/*:
 Enter all of the resources you found previously into Moneo's system by setting `suicideResource`, `moneo.mentalHealthResource`, `moneo.domesticViolenceResource`, `moneo.sexualAssaultResource`, `moneo.primaryCrisisResource`, and `moneo.secondaryCrisisResource` equal to the respective resources defined in Stage 2.
 - Example:
 ```
 moneo.suicideResource = suicideResource
 ```
 */

/*:
 This function takes a piece of text the user inputs and returns the Machine Learning model's prediction that predicts if the user is in a mental health crisis.
 */
let model = CrisisClassifier()
func classify(_ text: String) -> Classification? {
    do {
        let prediction = try model.prediction(text: text)
/*:
 Fill in the `switch` statment bellow to return the classifications `.harmSelf` and `.harmUser` for the `MLFeatureValue`s "harm self" and "harm user."
 */
        switch prediction.featureValue(for: "label") {
            
        case MLFeatureValue(string: ""):
            return .harmSelf
        case MLFeatureValue(string: ""):
            return .harmUser
        default:
            return .other
        }
    } catch {
        print(error)
        return nil
    }
    
}
/*:
 This function matches a piece of text the user has input with a Machine Learning model's prediction and returns corresponding resources to help that user.
 */
func findResources(_ text: String) -> [Resource] {
/*:
 Fill in the `switch` statement below to return an array Moneo's corresponding primary and secondary crisis resources with the determined classifications.
 - Example:
 ```
 return [moneo.suicideResource, moneo.mentalHealthResource]
 ```
 */
    switch classify(text) {
    case .harmSelf?:
        return []
    case .harmUser?:
        return []
    case .other?:
        return []
    default:
        return []
    }
}
/*:
 This function takes a piece of text the user inputs and creates a conversation that connects the user with necessary resources using Moneo's  Machine Learning model.
 */

func createConversation(_ text: String) -> [Message]{
    let classification = classify(text)
    var messages = [Message]()
    
/*:
 Set the variable `starterMessage` to greet the user
 - Example:
 ```
 let starterMessage = Message(text: "Hi! How are you today?", title: nil, sender: .moneo, classification: nil)
 ```
 */
    let starterMessage = Message(text: "", title: nil, sender: .moneo, classification: nil)
    messages.append(starterMessage)
    messages.append(Message(text: text, title: nil, sender: .user, classification: classification!))
    
    
/*:
 Set the variable `responseMessage` to empathize with the user before presenting them with needed resources.
 - Example:
 ```
 var responseMessage =  Message(text: "I’m so sorry to hear about this. Here are some resources that might be able to help you out:", title: nil, sender: .moneo, classification: nil)
 ```
 */
    var responseMessage =  Message(text: "", title: nil, sender: .moneo, classification: nil)
    if(classification == nil || classification == .other){
/*:
 Set `responseMessage` to thank the user for sharing their feelings and let them know that Moneo has found no resources that might be useful to them..
 - Example:
 ```
 responseMessage =  Message(text: "Thanks so much for sharing. I wasn’t able to match you with any resources to help you out in particular, but here are some that might be useful:", title: nil, sender: .moneo, classification: nil)
 ```
 */
        responseMessage =  Message(text: "", title: nil, sender: .moneo, classification: nil)
    }
    messages.append(responseMessage)
    for resource in findResources(text){
        messages.append(Message(text: resource.contactInfo, title: resource.name, sender: .moneo, classification: nil))
    }
    return messages
}
/*:
 Next, we will run several tests to display how Moneo works in action.
 */
let conversation1 = createConversation(moneo.test1)
moneo.displayConversation(conversation1)

let conversation2 = createConversation(moneo.test2)
moneo.displayConversation(conversation2)

let conversation3 = createConversation(moneo.test3)
moneo.displayConversation(conversation3)
/*:
 Lastly, save Moneo into the Appvenger system. by calling `system.saveProject`.
 - Example:
 ```
 system.saveProject(moneo)
 ```
 */

/*:
 ### Stage 5: Reflect
 Now is the time to take a step back and see how your users feel about your creation. In this step, agents ask those they intend to help to take their solution for a test drive.. Often, agents find
 themselves having to further iterate on the product; in order to ensure that they have addressed the problem with the most optimal solution.
 
 ***To see your superhero story in action and what your users thought about your creation, play the Playground.***
 
 
 ## One Final Note
 Although this is a suggested creative process, you are creator, innovator, disruptor, and most importantly an Appvenger. You will fiddle with, tweak, narrow, and refine your own creative process to one that best fits your powers. There is only one rule to being an Appvenger: use your powers to create good that triumphs over evil.
 
 ## Credits
 
 ### Songs
 * "The Avengers Theme Song" - Alan Silvestri
 * "Captain America Main Titles" - Alan Silvestri
 * "The Incredibles Theme Song" - Michael Giacchino
 * "Iron Man" - John O'Brien and Rick Boston
 * "Theme from Spiderman" - Danny Elfman
 * "Superman Theme Song" - John Williams
 * "Thor Theme Song" -  Patrick Doyle
 
 ### Code
 * "SKButtonNode" (https://github.com/bajtyngier/SKButtonNode/blob/master/SKButtonNode/SKButtonNode/SKButtonNode.swift) - Konrad Bajtyngier
 */
