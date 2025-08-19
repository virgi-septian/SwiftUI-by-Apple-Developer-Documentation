//
//  Message.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

enum MessageType {
    case user
    case reply
}

struct Message: Identifiable {
    var id: UUID = .init()
    var message: String
    var messageType: MessageType
}
/// User is another person who sent message and, reply is our message

let messages: [Message] = [
    .init(message: "Hi, how are you?", messageType: .user),
    .init(message: "I'm doing great, thanks for asking!", messageType: .reply),
    .init(message: "What are you up to today?", messageType: .user),
    .init(message: "Just working on some projects.", messageType: .reply),
    .init(message: "Same here! Any tips for staying productive?", messageType: .user),
    .init(message: "Sure! Take regular breaks and set clear goals for the day.", messageType: .reply),
    .init(message: "Thanks, that's really helpful!", messageType: .user),
    .init(message: "Glad I could help!", messageType: .reply),
    .init(message: "Do you know any good books on productivity?", messageType: .user),
    .init(message: "Yes, 'Atomic Habits' by James Clear is fantastic.", messageType: .reply),
    .init(message: "I'll check it out. What's it about?", messageType: .user),
    .init(message: "It's about building small habits that lead to big changes.", messageType: .reply),
    .init(message: "Sounds interesting! Do you read often?", messageType: .user),
    .init(message: "I try to read a little every day. It's a great habit.", messageType: .reply),
    .init(message: "Any other hobbies you enjoy?", messageType: .user),
    .init(message: "I love coding, and I enjoy hiking during the weekends.", messageType: .reply),
    .init(message: "Nice! Where's your favorite place to hike?", messageType: .user),
    .init(message: "There's a trail near a lake nearby-it's so peaceful.", messageType: .reply),
    .init(message: "That sounds amazing. Do you go with friends?", messageType: .user),
    .init(message: "Sometimes, but I also enjoy hiking alone to clear my mind.", messageType: .reply),
    .init(message: "I should try hiking sometime. What gear do I need?", messageType: .user),
    .init(message: "Comfortable shoes, water, and maybe a small backpack.", messageType: .reply),
    .init(message: "Got it! What's the longest hike you've done?", messageType: .user),
    .init(message: "Around 10 miles. It was tiring but very rewarding.", messageType: .reply),
    .init(message: "Wow, that's impressive! Did you take a lot of photos?", messageType: .user),
    .init(message: "Yes, the scenery was stunning. I love capturing nature.", messageType: .reply),
    .init(message: "Do you post your photos online?", messageType: .user),
    .init(message: "Not really, I just keep them for myself and friends.", messageType: .reply),
    .init(message: "That's cool. Thanks for sharing all this!", messageType: .user),
    .init(message: "No problem! Let me know if you want more tips!", messageType: .reply),
]

