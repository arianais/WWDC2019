//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).

import SpriteKit
import PlaygroundSupport
import Foundation
import UIKit


public class UI {
    
    //MARK: View Initalization
    let darkBlue = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    var buttonNode = SKNode()
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
    var scene = 1
    //MARK: Basic Nodes Initalization
    let content = SKNode()
    var titlePic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/titlePic"))
    //MARK:Title Page Nodes Initalization
    var title = SKLabelNode()
    var subtitle = SKLabelNode()
    //MARK: Chat Window Nodes Initalization
    var border = SKShapeNode()
    var messages = [SKNode]()
    
    //MARK: Init
    public init(){
        PlaygroundPage.current.liveView = view
        let scene = SKScene(size: CGSize(width: 500, height: 600))
        scene.scaleMode = .aspectFit
        scene.backgroundColor = darkBlue
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
        setTitlePage()
    }
    private func setTitlePage(){
        DispatchQueue.main.async {
            self.titlePic.setScale(1/4)
            self.titlePic.position = CGPoint(x: 250, y: 275.0)
            self.content.addChild(self.titlePic)
        }
        DispatchQueue.main.async {
            self.title.fontName = UIFont.systemFont(ofSize: 35, weight: .heavy).fontName
            self.title.text = "Moneo Demo"
            self.title.position = CGPoint(x: 250, y: 550)
            self.title.fontColor = .white
            self.content.addChild(self.title)
        }
        DispatchQueue.main.async {
            self.subtitle.attributedText = self.centerAlign("This is a demo of Moneo. Moneo is a chat bot that refers individuals in a mental health crisis to needed resources.")
            self.subtitle.preferredMaxLayoutWidth = 400
            self.subtitle.numberOfLines = 0
            self.subtitle.position = CGPoint(x: 250, y: 475)
            self.content.addChild(self.subtitle)
        }
        DispatchQueue.main.async {
            self.buttonNode = SKButtonNode(texture: SKTexture(imageNamed: "Images/button")) {
                self.next()
            }
            self.buttonNode.setScale(1/2)
            self.buttonNode.position = CGPoint(x: 460, y: 60)
            self.content.addChild(self.buttonNode)
        }
        
    }
    func createPg1(){
        createChatWindow()
        let bubble1 = createChatBubble(Message(text: "Hi! How are you today?", resource: nil, sender: .moneo))
        self.messages.append(bubble1)
        let bubble2 = createChatBubble(Message(text: "I feel empty, and I want to kill myself more than I have in a while but I don't have the energy. All I want to do is disappear and never come back.", resource: nil, sender: .user))
        self.messages.append(bubble2)
        let bubble3 = createChatBubble(Message(text: "I’m so sorry to hear about this. Here are some resrouces that might be helpful: ", resource: nil, sender: .moneo))
        self.messages.append(bubble3)
        let bubble4 = createChatBubble(Message(text: "Call 800-273-8255 to speak with a trained counselor.", resource: "National Suicide Prevention Lifeline", sender: .moneo))
        self.messages.append(bubble4)
        let bubble5 = createChatBubble(Message(text: "Text NAMI to 741-741 to connect with a trained crisis counselor.", resource: "Crisis Textline", sender: .moneo))
        self.messages.append(bubble5)
        
    }
    func createPg2(){
        createChatWindow()
        let bubble1 = createChatBubble(Message(text: "Hi! How are you today?", resource: nil, sender: .moneo))
        self.messages.append(bubble1)
        let bubble2 = createChatBubble(Message(text: "I’m going bonkers at my parents’ house because they’re so transphobic and abusive and I can’t take this anymore.", resource: nil, sender: .user))
        self.messages.append(bubble2)
        let bubble3 = createChatBubble(Message(text: "I’m so sorry to hear about this. Here are some resrouces that might be helpful: ", resource: nil, sender: .moneo))
        self.messages.append(bubble3)
        let bubble4 = createChatBubble(Message(text: "Call 800-799-7233 to speak with trained experts who provide confidential support to anyone experiencing domestic violence.", resource: "National Domestic Violence Lifeline", sender: .moneo))
        self.messages.append(bubble4)
        let bubble5 = createChatBubble(Message(text: "Call 800-656-4673 to connect with a trained staff member from a sexual assault service provider in your area.", resource: "National Sexual Assult Manual", sender: .moneo))
        self.messages.append(bubble5)
        
    }
    func createPg3(){
        createChatWindow()
        let bubble1 = createChatBubble(Message(text: "Hi! How are you today?", resource: nil, sender: .moneo))
        self.messages.append(bubble1)
        let bubble2 = createChatBubble(Message(text: "I have these fantasies of just killing or torturing those who have wronged me or others, it feels good to think about...", resource: nil, sender: .user))
        self.messages.append(bubble2)
        let bubble3 = createChatBubble(Message(text: "I’m so sorry to hear about this. Here are some resrouces that might be helpful: ", resource: nil, sender: .moneo))
        self.messages.append(bubble3)
        let bubble4 = createChatBubble(Message(text: "Call (888) 993-3112 to speak with a trained counselor.", resource: "Mental Health Hotline", sender: .moneo))
        self.messages.append(bubble4)
        let bubble5 = createChatBubble(Message(text: "Text NAMI to 741-741 to connect with a trained crisis counselor.", resource: "Crisis Textline", sender: .moneo))
        self.messages.append(bubble5)
    }
    func createPg4(){
        createChatWindow()
        let bubble1 = createChatBubble(Message(text: "Hi! How are you today?", resource: nil, sender: .moneo))
        self.messages.append(bubble1)
        let bubble2 = createChatBubble(Message(text: "I want to kill everyone in my family so badly. It’s getting to the point where I don’t even love them anymore. They disgust me.", resource: nil, sender: .user))
        self.messages.append(bubble2)
        let bubble3 = createChatBubble(Message(text: "I’m so sorry to hear about this. Here are some resrouces that might be helpful: ", resource: nil, sender: .moneo))
        self.messages.append(bubble3)
        let bubble4 = createChatBubble(Message(text: "Call (775) 784-8090 to speak with a trained counselor.", resource: "Crisis Call Center", sender: .moneo))
        self.messages.append(bubble4)
        let bubble5 = createChatBubble(Message(text: "Text NAMI to 741-741 to connect with a trained crisis counselor.", resource: "Crisis Textline", sender: .moneo))
        self.messages.append(bubble5)
    }
    func createChatWindow(){
        DispatchQueue.main.async {
            self.border = SKShapeNode(rect: CGRect(x: 100, y: 35, width: 300, height: 550) , cornerRadius: 20)
            self.border.strokeColor = .white
            self.border.fillColor = .clear
            self.content.addChild(self.border)
        }
    }
    func createChatBubble(_ message: Message) -> SKNode{
      
    
        var textLb = SKLabelNode(fontNamed: UIFont.systemFont(ofSize: 12.0, weight: .regular).fontName)
        textLb.fontSize = 12.0
        if(message.resource != nil && message.resource != ""){
            textLb.attributedText = NSMutableAttributedString().bold("\(message.resource!)\n").normal(message.text)
        } else {
             textLb.text = message.text
        }
        textLb.fontColor = .white
        textLb.preferredMaxLayoutWidth = 250
        textLb.numberOfLines = 0
        if message.sender == .moneo {
            textLb.fontColor = self.darkBlue
        }
        textLb.position = CGPoint(x: (textLb.frame.width/2) + 10, y: (textLb.frame.height/2) + 10)
        textLb.horizontalAlignmentMode = .center
        textLb.verticalAlignmentMode = .center
        
        let bubble = SKShapeNode(rect: CGRect(x: 0, y: 0, width: textLb.frame.width + 20, height: textLb.frame.height + 20), cornerRadius: 10)
        bubble.fillColor = .white
        if message.sender == .user {
            bubble.fillColor = UIColor(displayP3Red: (89.0/255.0), green: (88.0/255.0), blue: (107.0/255.0), alpha: 1.0)
        }
        bubble.position = CGPoint(x: 0, y: 0)
        bubble.addChild(textLb)
        
        
        var senderLb = SKLabelNode(fontNamed: UIFont.systemFont(ofSize: 10.0, weight: .regular).fontName)
        senderLb.position = CGPoint(x: 15, y: bubble.frame.maxY + 5)
        senderLb.text = "User"
        if message.sender == .moneo {
            senderLb.text = "Moneo"
            senderLb.position = CGPoint(x: bubble.frame.width - 25, y: bubble.frame.maxY + 5)
        }
        senderLb.fontSize = 10.0
        senderLb.fontColor = .white
        
        let chatBubble = SKNode()
        var y = CGFloat(525.0)
        if(self.messages.count > 0) {
            y = messages.last!.frame.minY - CGFloat(100.0)
        }
        chatBubble.position = CGPoint(x: 115, y: y)
        if message.sender == .moneo {
            chatBubble.position = CGPoint(x: 300 - (bubble.frame.width/2), y: y)
        }
        
        chatBubble.addChild(senderLb)
        chatBubble.addChild(bubble)
        self.content.addChild(chatBubble)
        return chatBubble
    }
    @objc func next(){
        switch scene {
        case 1:
            self.title.run(SKAction.fadeOut(withDuration: 0.5))
            self.subtitle.run(SKAction.fadeOut(withDuration: 0.5))
            self.titlePic.run(SKAction.fadeOut(withDuration: 0.5))
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 0.5),
                SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.createPg1()
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
        case 2:
            for message in self.messages {
                message.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 0.5),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.createPg2()
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            messages = []
        case 3:
            for message in self.messages {
                message.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 0.5),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.createPg3()
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            messages = []
        case 4:
            for message in self.messages {
                message.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 0.5),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.createPg4()
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            messages = []
            self.buttonNode.isHidden = true
        default:
            break
        }
        scene += 1
    }
    private func centerAlign(_ string: String) -> NSAttributedString{
        let attrString = NSMutableAttributedString(string: string)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: string.count)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .regular)], range: range)
        return attrString
    }
}
extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12.0, weight: .bold)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
