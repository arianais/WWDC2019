//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).

import SpriteKit
import PlaygroundSupport
import Foundation
import UIKit


public class UI {
    
    //MARK: Basic Variables
    var scene = 0
    var time = 0.0
    var songTime = 0.0
    public var superhero = ""
    public var agent = ""
    var images = [UIImage]()
    //MARK: View Initalization
    let darkBlue = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    var buttonNode = SKNode()
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    //MARK: Basic Nodes Initalization
    let content = SKNode()
    //MARK: Narrative Nodes Initalization
    var mainPic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/pg1"))
    var scenePic = SKSpriteNode()
    var imageNode = SKSpriteNode()
    var bubble = SKShapeNode()
    var bubbleText = SKLabelNode()
    var narrative = ["Once upon a time, there was a creator who had a knack for tinkering and innovating behind a pixelated screen.", "One day this creator got a text asking if they would like to join the Appvengers — a secret team of elite technical superheroes determined to use their powers to improve the world with technology.", "The creator happily accepted and became a superhero.", "This hero's first training mission was the Moneo Mission. The required the superhero to create a piece of technology to help those experiencing a mental health crisis, or those needing immediate mental health care. The superhero decided to start this mission by interviewing those who had experienced this issue in her community.", "After conducting many interviews, the superhero used the information gathered to generate a flurry of possible solutions. Looking at the wall covered in sticky notes, the superhero began to see one idea glistening through the clutter.", "After seeing that this idea was the one, the superhero got to work and began to use their superpowers to create the chatbot.", "Some time later, the superhero finished a prototype of Moneo — a chatbot that refered individuals in a mental health crisis to needed helplines and resources.", "Then the superhero shared Moneo with their community and was amazed to see how appreaciative others were of the technology that they had created.", "The superhero flew back that day to their laptop eager to use their superpowers to create more good in their community.", "The End :)"]
    //MARK:Title Page Nodes Initalization
    var title = SKLabelNode()
    var titlePic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/titlePic"))
    var subtitle = SKLabelNode()
    var warning = SKLabelNode()
    //MARK: Chat Window Nodes Initalization
    var border = SKShapeNode()
    var msgs = [SKNode]()
    public var messages = [[Message]]()
    
    
    //MARK: Init
    public init(){
        PlaygroundPage.current.liveView = view
        let scene = SKScene(size: CGSize(width: 500, height: 500))
        scene.scaleMode = .aspectFit
        scene.backgroundColor = self.darkBlue
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
    }
    public func setTitlePage(){
        if(self.superhero != ""){
            DispatchQueue.main.async {
                let cam = Camera()
                cam.retrieveImages({ (images) in
                    self.images = images
                    self.mainPic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/pg1"))
                    self.mainPic.setScale(1/3)
                    self.mainPic.alpha = 0.0
                    self.mainPic.position = CGPoint(x: 250, y: 250)
                    
                    self.imageNode = SKSpriteNode(texture: SKTexture(image: self.images[0]))
                    self.imageNode.alpha = 0.0
                    self.imageNode.setScale(1/15)
                    self.imageNode.position = CGPoint(x: 254, y:  254)
                    
                    self.content.addChild(self.imageNode)
                    self.content.addChild(self.mainPic)
                    
                    self.buttonNode = SKButtonNode(texture: SKTexture(imageNamed: "Images/button")) {
                        self.next()
                    }
                    self.buttonNode.setScale(1/3)
                    self.buttonNode.position = CGPoint(x: 450, y: 250)
                    self.content.addChild(self.buttonNode)
                })
            }
            DispatchQueue.main.async {
                self.titlePic.setScale(1/4)
                self.titlePic.position = CGPoint(x: 250, y: 240.0)
                self.content.addChild(self.titlePic)
            }
            DispatchQueue.main.async {
                self.title.fontName = UIFont.systemFont(ofSize: 30, weight: .heavy).fontName
                self.title.text = "The Moneo Mission"
                self.title.position = CGPoint(x: 250, y: 452.5)
                self.title.fontSize = 30.0
                self.title.fontColor = .white
                self.content.addChild(self.title)
            }
            DispatchQueue.main.async {
                self.subtitle.attributedText = self.centerAlign("The Amazing \(self.superhero) Vol. 1", 14.0, .white)
                self.subtitle.preferredMaxLayoutWidth = 400
                self.subtitle.numberOfLines = 0
                self.subtitle.position = CGPoint(x: 250, y: 425)
                self.content.addChild(self.subtitle)
            }
            DispatchQueue.main.async {
                self.warning.attributedText = self.centerAlign("*This demo contains content relating to suicide, abuse, and violence that may be triggering to others.", 10.0, .white)
                self.warning.preferredMaxLayoutWidth = 300
                self.warning.numberOfLines = 0
                self.warning.position = CGPoint(x: 250, y: 10)
                self.content.addChild(self.warning)
            }
            
            DispatchQueue.main.async {
                if(self.agent != "" && self.self.superhero != ""){
                    self.narrative[0] = "Once upon a time, there was a creator named \(self.agent) who had a knack for tinkering and innovating behind a pixelated screen."
                    self.narrative[1] = "One day \(self.agent) got a text asking if they would like to join the Appvengers — a secret team of elite technical superheroes determined to use their powers to improve the world with technology."
                    self.narrative[2] = "\(self.agent) happily accepted and became \(self.superhero)."
                    self.narrative[3] = "\(self.superhero) first training mission as a superhero was the Moneo Mission. The Mission tasked \(self.superhero) with creating a piece of technology to help those experiencing a mental health crisis, or those needing immediate mental health care. \(self.superhero) decided to start this mission by interviewing those who had experienced this issue in her community."
                    self.narrative[4] = "After conducting many interviews, \(self.superhero) used the information gathered to generate a flurry of possible solutions. Looking at the wall covered in sticky notes, \(self.superhero) began to see one idea glistening through the clutter."
                    self.narrative[5] = "After seeing that this idea was the one, \(self.superhero) got to work and began to use their superpowers to create the idea detailed on the sticky note."
                    self.narrative[6] = "Some time later, \(self.superhero) finished a prototype of Moneo — a chatbot that refered individuals in a mental health crisis to needed helplines and resources."
                    self.narrative[7] = "Then \(self.superhero) shared Moneo with their community and was amazed to see how appreaciative others were of the technology that they had created."
                    self.narrative[8] = "\(self.superhero) flew back that day to their laptop eager to use their superpowers to create more good in their community."
                }
            }
            DispatchQueue.main.async {
                self.bubbleText.fontSize = 12.0
                self.bubbleText.fontName = UIFont.systemFont(ofSize: 12.0, weight: .regular).fontName
                self.bubbleText.fontColor = self.darkBlue
                self.bubbleText.preferredMaxLayoutWidth = 430
                self.bubbleText.numberOfLines = 0
            }
        }
    }
    func createPictureScene(_ scene: Int){
        DispatchQueue.main.async {
            if(scene == 1){
                self.imageNode.alpha = 0.0
                self.imageNode.run(SKAction.fadeIn(withDuration: 0.5))
                self.mainPic.run(SKAction.fadeIn(withDuration: 0.5))
            } else {
                if(scene == 2 || scene == 4 || scene == 7){
                    self.imageNode.run( SKAction.fadeOut(withDuration: 0.5))
                } else if self.scene == 3 {
                    self.imageNode.alpha = 0.0
                    self.imageNode.position = CGPoint(x: 230, y: 335)
                    self.imageNode.setScale((1.0/43))
                    self.imageNode.run(SKAction.fadeIn(withDuration: 0.5))
                } else if self.scene == 6 {
                    self.imageNode.alpha = 0.0
                    self.imageNode.setScale(1/15)
                    self.imageNode.position = CGPoint(x: 252.5, y:  255)
                    self.imageNode.run(SKAction.fadeIn(withDuration: 0.5))
                } else if scene == 10 {
                    self.imageNode.alpha = 0.0
                    self.imageNode.position = CGPoint(x: 243, y: 280)
                    self.imageNode.setScale((1.0/54))
                    self.imageNode.run(SKAction.fadeIn(withDuration: 0.5))
                }
            
                    self.mainPic.run(SKAction.sequence([ SKAction.fadeOut(withDuration: 0.5), SKAction.animate(with: [SKTexture(imageNamed: "Images/pg\(scene)")], timePerFrame: 0.0), SKAction.fadeIn(withDuration: 0.5)]))
                
            }
        }
        DispatchQueue.main.async {
            let action = SKAction.run {
                self.bubbleText.removeFromParent()
                self.bubble.removeFromParent()
                self.bubbleText.text = self.narrative[scene - 1]
            
                self.bubbleText.position = CGPoint(x: 0 , y: -(self.bubbleText.frame.height/2.0))
            
                self.bubble = SKShapeNode(rectOf: CGSize(width: self.bubbleText.frame.width + 30, height: self.bubbleText.frame.height + 30), cornerRadius: 10.0)
                self.bubble.position = CGPoint(x: 250, y: 500 - (self.bubbleText.frame.height/2.0) - 25 )
                self.bubble.fillColor = .white
                self.bubble.strokeColor = .clear
            
                self.bubble.addChild(self.bubbleText)
                self.bubble.alpha = 0.0
                self.bubble.run(SKAction.fadeIn(withDuration: 0.5))
                self.content.addChild(self.bubble)
            }
          
            if(scene == 1){
                self.content.run(action)
               // self.buttonNode.run(SKAction.sequence([SKAction.wait(forDuration: 5.0), SKAction.fadeIn(withDuration: 0.5)]))
            }
            else if(scene != 10) {
                self.content.run(action)
                self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: self.songTime - 1.0), SKAction.fadeIn(withDuration: 0.5)]))
            } else {
                self.bubble.run(SKAction.fadeOut(withDuration: 0.5))
                self.buttonNode.run(SKAction.fadeOut(withDuration: 0.5))
            }

        }
    }
    func createScene(_ scene: Int){
        for message in messages[scene]{
            let bubble = createChatBubble(message)
            self.msgs.append(bubble)
            bubble.alpha = 0.0
            bubble.run(SKAction.sequence([SKAction.wait(forDuration: time), SKAction.fadeIn(withDuration: 0.5)]))
            time += 3.0
        }
        
    }
    func createChatWindow(){
        DispatchQueue.main.async {
            self.border = SKShapeNode(rect: CGRect(x: 100, y: 15, width: 300, height: 470) , cornerRadius: 15)
            self.border.strokeColor = .white
            self.border.fillColor = .clear
            self.content.addChild(self.border)
        }
    }
    func createChatBubble(_ msg: Message) -> SKNode{
        let textLb = SKLabelNode(fontNamed: UIFont.systemFont(ofSize: 12.0, weight: .regular).fontName)
        textLb.fontSize = 12.0
        if(msg.title != nil && msg.title != ""){
            textLb.attributedText = NSMutableAttributedString().bold("\(msg.title!)\n").normal(msg.text)
        } else {
            textLb.text = msg.text
        }
        textLb.fontColor = .white
        textLb.preferredMaxLayoutWidth = 225
        textLb.numberOfLines = 0
        if msg.sender == .moneo {
            textLb.fontColor = self.darkBlue
        }
        textLb.position = CGPoint(x: (textLb.frame.width/2) + 10, y: (textLb.frame.height/2) + 10)
        textLb.horizontalAlignmentMode = .center
        textLb.verticalAlignmentMode = .center
        
        let bubble = SKShapeNode(rect: CGRect(x: 0, y: 0, width: textLb.frame.width + 20, height: textLb.frame.height + 20), cornerRadius: 10)
        bubble.fillColor = .white
        if msg.sender == .user {
            bubble.fillColor = UIColor(displayP3Red: (89.0/255.0), green: (88.0/255.0), blue: (107.0/255.0), alpha: 1.0)
        }
        bubble.position = CGPoint(x: 0, y: 0)
        bubble.addChild(textLb)
        
        let senderLb = SKLabelNode(fontNamed: UIFont.systemFont(ofSize: 10.0, weight: .regular).fontName)
        senderLb.position = CGPoint(x: 15, y: bubble.frame.maxY + 5)
        senderLb.text = "User"
        if msg.sender == .moneo {
            senderLb.text = "Moneo"
            senderLb.position = CGPoint(x: bubble.frame.width - 25, y: bubble.frame.maxY + 5)
        }
        senderLb.fontSize = 10.0
        senderLb.fontColor = .white
        
        let chatBubble = SKNode()
        var y = CGFloat(425.0)
        if(self.msgs.count > 0) {
            y = msgs.last!.frame.minY - CGFloat(100.0)
        }
        chatBubble.position = CGPoint(x: 115, y: y)
        if msg.sender == .moneo {
            chatBubble.position = CGPoint(x: (195 - (bubble.frame.width)) + 195, y: y)
        }
        
        chatBubble.addChild(senderLb)
        chatBubble.addChild(bubble)
        self.content.addChild(chatBubble)
        return chatBubble
    }
    @objc func next(){
        switch scene {
        case 0:
            self.title.run(SKAction.fadeOut(withDuration: 0.5))
            self.subtitle.run(SKAction.fadeOut(withDuration: 0.5))
            self.warning.run(SKAction.fadeOut(withDuration: 0.5))
            self.titlePic.run(SKAction.fadeOut(withDuration: 0.5))
            
            let action = SKAction.run {
                self.songTime = 6.0
                self.createPictureScene(1)
                self.content.run(SKAction.playSoundFileNamed("Themes/ironman.mp3", waitForCompletion: false))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 4.0), SKAction.fadeIn(withDuration: 0.5)]))
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
        case 1:
            self.songTime = 4.0
            self.createPictureScene(2)
            self.content.run(SKAction.playSoundFileNamed("Themes/avengers.mp3", waitForCompletion: false))
        case 2:
            self.songTime = 3.0
            self.createPictureScene(3)
            self.content.run(SKAction.playSoundFileNamed("Themes/superman.mp3", waitForCompletion: false))
        case 3:
            self.songTime = 3.0
            self.createPictureScene(4)
            self.content.run(SKAction.playSoundFileNamed("Themes/mulan.mp3", waitForCompletion: false))
        case 4:
            self.songTime = 3.0
            self.createPictureScene(5)
            self.content.run(SKAction.playSoundFileNamed("Themes/spiderman.mp3", waitForCompletion: false))
        case 5:
            self.songTime = 3.0
            self.createPictureScene(6)
            self.content.run(SKAction.playSoundFileNamed("Themes/batman.mp3", waitForCompletion: false))
        case 7:
            self.songTime = 3.0
            self.createPictureScene(7)
            self.content.run(SKAction.playSoundFileNamed("Sounds/sparkle.mp3", waitForCompletion: false))
        case 8:
            self.bubble.run(SKAction.fadeOut(withDuration: 0.5))
            self.mainPic.run(SKAction.fadeOut(withDuration: 0.5))
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0), SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createChatWindow()
                self.createScene(0)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
        case 9:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0), SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createScene(1)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
        case 10:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0), SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createScene(2)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
        case 11:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 0.5), SKAction.fadeIn(withDuration: 0.5)]))
            
            self.border.run(SKAction.fadeOut(withDuration: 0.5))
            let action = SKAction.run {
                self.songTime = 8.0
                self.createPictureScene(8)
                self.content.run(SKAction.playSoundFileNamed("Themes/incredibles.mp3", waitForCompletion: false))
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
        case 12:
            self.songTime = 8.0
            self.createPictureScene(9)
            self.content.run(SKAction.playSoundFileNamed("Themes/captianamerica.mp3", waitForCompletion: false))
        case 13:
            self.createPictureScene(10)
        default:
            break
        }
        scene += 1
    }
    private func centerAlign(_ string: String, _ size: CGFloat, _ color: UIColor) -> NSAttributedString{
        let attrString = NSMutableAttributedString(string: string)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: string.count)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font : UIFont.systemFont(ofSize: size, weight: .regular)], range: range)
        return attrString
    }
    private func fadeIn(_ node: SKNode) -> SKAction{
        node.alpha = 0.0
        let sequence = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0)])
        return sequence
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
