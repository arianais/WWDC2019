import CoreML
/*:
# The Moneo Mission
 - Note:
 **This playground was created to teach budding creators how to code and design technology with meaningful social impact by creating chatbot that refers people in mental health crises to local support resources.** Using creative problem solving and CoreML, students are taught how to use cutting-edge technology to address problems and create change within their own communities.
 
Congradulations, you have been chosen to become an Appvenger. The Appvengers is a secret team of elite technical superheros determined to use their powers to improve the world with technology. But, before you become an official superhero, you must decide on your superhero name and go through some superhero training.
 
 ## Before your training begins…
  */
 let system  = System()
/*:
 1. Make sure you've added a picture of yourself to the "Resources" folder named `agent.png` so that the other agents can identify you. This picture should contain a clear picture of your face (and no other faces), such as a school yearbook photo.
 * Callout(Sample Photos):
 ![Photo of Sample Photos](Images/examples.png)
 2. Enter your first name into the Appvenger’s system to verify your idenity by setting `system.agent` equal to a string of your name.
 - Example:
 ```
 system.agent = “Ari”
 ```
 */
system.agent = "Ari"
/*:
 3. Add your superhero name into the Appvenger’s system by setting `system.superhero` equal to a string of your new superhero name.
 - Example:
 ```
 system.superhero = “Fire Pixel”
 ```
*/
system.superhero = "Fire Pixel"
/*:
## Top Secret Information
Your training will be centered around learning the Appvenger’s creative problem solving process, a secret toolkit the Appvengers use during each of their missions. This five stage process will guide you through evaluating problems in your community and using your powers to create meaningful change.
 
  * Callout(Mission):
During this training session, you will be tasked with creating a technological solution to help those in mental health crises.

 ### Stage 1: Understand & Research
 In this stage, Appvengers usually read the guidelines and suggestions for the mission that they have been assigned. They then interview individuals who have faced or studied the problem the mission is addressing. We have included a sample interview with mental health expert bellow that is based off of information published by the National Alliance on Mental Health.
 
***Interview***
 1. **What is an example of a mental health crisis?** You’re getting ready to meet up with your friend Jill when she tells you she has to bail. You ask, “Is something wrong?” She responds, “Just not feeling life today.” You tell Jill you are coming over to her house, where you find Jill crying. She tells you, “Life is too hard.”
 2. **How should you help people in these events?** First, practice clear communication -- it is essential they feel heard and understood and use an empathetic, non-judgmental tone. Second, reach out for help. If you feel that you are not able to de-escalate the person in crisis without additional support, call someone or connect the individual with a crisis resource.
 
 In the interview, the expert said a possible solution in these situations is connecting an individuals in crisis to mental health resoures. Research and find 1 local hotline or textline that support individuals dealing expierencing each of the following: suicide, abuse, mental illness, and crisis. After, set the following variables to equal these resources: `suicideResource`, `mentalHealthResource`, `domesticViolenceResource`, `sexualAssaultResource`, `primaryCrisisResource`, and `secondaryCrisisResource`.
 - Example:
 ```
let suicideResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
 ```
 */
let suicideResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
let mentalHealthResource = Resource(name: "Mental Health Hotline", contactInfo:  "Call (888) 993-3112 to speak with a trained counselor.")

let domesticViolenceResource = Resource(name: "National Domestic Violence Lifeline", contactInfo: "Call 800-799-7233 to speak with trained experts who provide confidential support.")
let sexualAssaultResource = Resource(name: "National Suicide Prevention Lifeline", contactInfo: "Call 800-273-8255 to speak with a trained counselor.")
let primaryCrisisResource = Resource(name: "Teen Line", contactInfo: "Call 310-855-4673 to connect with at trained teen counselor.")
let secondaryCrisisResource = Resource(name: "Crisis Textline", contactInfo: "Text NAMI to 741-741 to connect with a trained crisis counselor.")

/*:
 ## Stage 2: Ideate & Select
 In this stage, Appvengers throw out a bunch of ideas of possible solutions to the problem they are adressing and decided on a solution they want to proceed with. Although this is an invaluable step, we have choosen to go with one solution to simplify your training for the time being.
 
 * Callout(Project):
In this mission, you will be creating a prototype of a chatbot named Moneo that connects users to in crisis to mental health resources. Moneo will be powered by a machine learning model that classifies messages sent by the user and decides if the user is likely to hurt themselves or if someone is hurting them. If Moneo identifies that the user might be clasified into one of the following, Moneo sends two local textlines or hotlines that might be able to help the user.

 ## Stage 3: Planning & Building
 In this stage, agents usually draw or craft a wireframe, or a sketch of what their technological solution will look like. We’ve created one bellow as an example.
 
 Next, it is time to put this plan into action. First, define a `moneo` variable and set it equal to an instance of the `Moneo` class to create the Moneo chatbot.
*/
let moneo = Moneo()
/*:
Enter all of the resources you found previously into Moneo's system by setting `suicideResource`, `moneo.mentalHealthResource`, `moneo.domesticViolenceResource`, `moneo.sexualAssaultResource`, `moneo.primaryCrisisResource`, and `moneo.secondaryCrisisResource` equal to the respective resources defined in Stage 2.
 - Example:
 ```
moneo.suicideResource = suicideResource
 ```
 */
moneo.suicideResource = suicideResource
moneo.mentalHealthResource = mentalHealthResource
moneo.domesticViolenceResource = domesticViolenceResource
moneo.sexualAssaultResource = sexualAssaultResource
moneo.primaryCrisisResource =  primaryCrisisResource
moneo.secondaryCrisisResource = secondaryCrisisResource
/*:
 This function takes a piece of text inputted by the user and returns the Machine Learning model's prediction that states if the user is in a mental health crisis.
 */
let model = CrisisClassifier()
func classify(_ text: String) -> Classification? {
    do {
        let prediction = try model.prediction(text: text)
/*:
Fill in the `switch` statment bellow to return the classifications `.harmSelf`, `.harmUser`, and `.other`.
*/
        switch prediction.featureValue(for: "label") {

        case MLFeatureValue(string: "harm self"):
            return .harmSelf
        case MLFeatureValue(string: "harm user"):
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
 This function matches a piece of text inputted by the user with a Machine Learning model's prediction and returns corresponding resources to help that user.
 */
func findResources(_ text: String) -> [Resource] {
/*:
Fill in the `switch` statment bellow to return an array Moneo's corresponding secondary and primary crisis resoures with the classifcations determined.
 - Example:
 ```
return [moneo.suicideResource, moneo.mentalHealthResource]
 ```
*/
    switch classify(text) {
    case .harmSelf?:
        return [moneo.suicideResource, moneo.mentalHealthResource]
    case .harmUser?:
        return [moneo.domesticViolenceResource, moneo.sexualAssaultResource]
    case .other?:
        return [moneo.primaryCrisisResource, moneo.secondaryCrisisResource]
    default:
        return []
    }
 
    
}
/*:
 This function takes a piece of text inputted by the user and creates a conversation that connects the user with necissary resoures using Moneo's  Machine Learning model.
 */
func createConversation(_ text: String) -> [Message]{
    let classification = classify(text)
    var messages = [Message]()
/*:
Create a variable called `starterMessage` that asks the user how they are doing today.
 - Example:
 ```
let starterMessage = Message(text: "Hi! How are you today?", title: nil, sender: .moneo, classification: nil)
 ```
*/
    let starterMessage = Message(text: "Hi! How are you today?", title: nil, sender: .moneo, classification: nil)
    messages.append(starterMessage)
    messages.append(Message(text: text, title: nil, sender: .user, classification: classification!))
/*:
     Create a variable called `responseMessage` that empathiszes with the user before presenting them with needed resources.
- Example:
```
var responseMessage =  Message(text: "I’m so sorry to hear about this. Here are some resources that might be able to help you out:", title: nil, sender: .moneo, classification: nil)
```
*/
    var responseMessage =  Message(text: "I’m so sorry to hear about this. Here are some resources that might be able to help you out:", title: nil, sender: .moneo, classification: nil)
    if(classification == nil || classification == .other){
/*:
    Set `responseMessage` to thank the user for sharing their feelings and let them know that Moneo has found no resources that might help them out in particular.
 - Example:
 ```
 responseMessage =  Message(text: "Thanks so much for sharing. I wasn’t able to match you with any resources to help you out in particular, but here are some that might be useful:", title: nil, sender: .moneo, classification: nil)
 ```
*/
        responseMessage =  Message(text: "Thanks so much for sharing. I wasn’t able to match you with any resources to help you out in particular, but here are some that might be useful:", title: nil, sender: .moneo, classification: nil)
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
 Lastly, we will save Moneo into the Appvenger system. by calling `system.saveProject`.
 - Example:
 ```
 system.saveProject(moneo)
 ```
 */
system.saveProject(moneo)
/*:
### Stage 5: Reflect
 Now is the time to take a step back and see how your users find your creation. In this step, agents ask those they intended to help with their creation to use or test it. Often, agents find
 themselves returning to the previous stages to further iterate on my product and make sure what I have created truly solves the problem I'm addressing.
 
***To see your superhero story in action and what your users thought about your creation, play the Playground.***
 
 
 ##One Final Note
 Although this is a suggested creative process, you are creator, innovator, disruptor, and most importantly an Appvenger. You will fiddle with, tweak, narrow, and refine your own creative process to one that best fits your powers. There is only one rule to being an Appvenger: use your powers to create good that triumphs over evil.
 */
