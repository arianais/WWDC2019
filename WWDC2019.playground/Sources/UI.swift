//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).

import SpriteKit
import PlaygroundSupport
import Foundation
import UIKit


public class UI {
    
    //MARK: Basic Variables
    var scene = 0
    var time = 0.0
    public var superhero = ""
    public var agent = ""
    //MARK: View Initalization
    let darkBlue = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    var buttonNode = SKNode()
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    //MARK: Basic Nodes Initalization
    let content = SKNode()
    var titlePic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/titlePic"))
    var mainPic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/pg1"))
    //MARK:Title Page Nodes Initalization
    var title = SKLabelNode()
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
        scene.backgroundColor = darkBlue
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
    }
    public func setTitlePage(){
        if(self.superhero != ""){
            DispatchQueue.main.async {
                self.mainPic.setScale(1/3)
                self.mainPic.position = CGPoint(x:250, y: 250)
                self.mainPic.alpha = 0.0
                self.content.addChild(self.mainPic)
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
                self.subtitle.attributedText = self.centerAlign("The Amazing \(self.superhero) Vol. 1", 14.0)
                self.subtitle.preferredMaxLayoutWidth = 400
                self.subtitle.numberOfLines = 0
                self.subtitle.position = CGPoint(x: 250, y: 425)
                self.content.addChild(self.subtitle)
            }
            DispatchQueue.main.async {
                self.warning.attributedText = self.centerAlign("*This demo contains content relating to suicide, abuse, and violence that may be triggering to others.", 10.0)
                self.warning.preferredMaxLayoutWidth = 300
                self.warning.numberOfLines = 0
                self.warning.position = CGPoint(x: 250, y: 10)
                self.content.addChild(self.warning)
            }
            DispatchQueue.main.async {
                self.buttonNode = SKButtonNode(texture: SKTexture(imageNamed: "Images/button")) {
                    self.next()
                }
                self.buttonNode.setScale(1/3)
                self.buttonNode.position = CGPoint(x: 450, y: 250)
                self.content.addChild(self.buttonNode)
            }
        }
        
    }
    func createPictureScene(_ scene: Int){
        DispatchQueue.main.async {
            if(self.scene == 1){
                self.mainPic.run(SKAction.sequence([SKAction.animate(withNormalTextures: [SKTexture(imageNamed: "Images/pg\(scene)")], timePerFrame: 0.5), SKAction.fadeIn(withDuration: 0.5)]))
            } else {
                  self.mainPic.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.animate(withNormalTextures: [SKTexture(imageNamed: "Images/pg\(scene)")], timePerFrame: 0.5), SKAction.fadeIn(withDuration: 0.5)]))
            }
        }
    }
    func createScene(_ scene: Int){
        createChatWindow()
        for message in messages[scene]{
            let bubble = createChatBubble(message)
            self.msgs.append(bubble)
            bubble.alpha = 0.0
            bubble.run(SKAction.sequence([SKAction.wait(forDuration: time), SKAction.fadeIn(withDuration: 0.5)]))
            time += 3.0
        }
        
    }
    func showIndicator(_ classification: Classification) -> SKLabelNode{
        switch classification {
        case .harmSelf:
            return createIndicatorNode(text: "User is likely to harm themselves.")
        case .harmUser:
            return createIndicatorNode(text: "Someone might be harming the user.")
        default:
            return createIndicatorNode(text: "Moneo has identified no indicators.")
        }
    }
    func createIndicatorNode(text: String) -> SKLabelNode{
        let label = SKLabelNode(text: text)
        label.fontSize = 14.0
        label.fontColor = .white
        label.alpha = 0.4
        return label
    }
    func createChatWindow(){
        DispatchQueue.main.async {
            self.border = SKShapeNode(rect: CGRect(x: 100, y: 15, width: 300, height: 470) , cornerRadius: 20)
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
        
        var senderLb = SKLabelNode(fontNamed: UIFont.systemFont(ofSize: 10.0, weight: .regular).fontName)
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
                self.createPictureScene(1)
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
        case 1:
            self.createPictureScene(2)
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
        case 2:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createPictureScene(1)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
            
        case 3:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createScene(1)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
        case 4:
            for msg in self.msgs {
                msg.run(SKAction.fadeOut(withDuration: 0.5))
            }
            self.buttonNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.wait(forDuration: 12.0),
                                                   SKAction.fadeIn(withDuration: 0.5)]))
            let action = SKAction.run {
                self.time = 0.0
                self.createScene(2)
            }
            self.content.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), action]))
            msgs = []
        default:
            break
        }
        scene += 1
    }
    private func centerAlign(_ string: String, _ size: CGFloat) -> NSAttributedString{
        let attrString = NSMutableAttributedString(string: string)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: string.count)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: size, weight: .regular)], range: range)
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
