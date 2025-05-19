//
//  AdvancedTextStyling.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 06/05/25.
//

import SwiftUI

struct AdvancedTextStyling: View {
    var message1: AttributedString {
        var result = AttributedString("Hello, World!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .red
        
        return result
    }
    
    var message2: AttributedString {
        var result = AttributedString("Hello, World!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        result.underlineStyle = Text.LineStyle(pattern: .solid, color: .white)
        
        return result
    }
    
    var message: AttributedString {
        let string = "The letters go up and down"
        var result = AttributedString()

        for (index, letter) in string.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index)) * 0.5 - 0.25
            result += letterString
        }

        result.font = .largeTitle
        return result
    }
    
    var attachTappableLink: AttributedString {
        var result = AttributedString("Learn Swift here")
        result.font = .largeTitle
        result.link = URL(string: "https://www.hackingwithswift.com")
        return result
    }
    
    var messageVoice: AttributedString {
        var password = AttributedString("abCayer-muQai")
        password.accessibilitySpeechSpellsOutCharacters = true
        return "Your password is: " + password
    }
    
    var messageDate: AttributedString {
        var result = Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).attributed)
        result.foregroundColor = .secondary

        let weekday = AttributeContainer.dateField(.weekday)
        let weekdayStyling = AttributeContainer.foregroundColor(.primary)
        result.replaceAttributes(weekday, with: weekdayStyling)

        return result
    }
    
    var messagePeople: AttributedString {
        var components = PersonNameComponents()
        components.givenName = "Taylor"
        components.familyName = "Swift"

        var result = components.formatted(.name(style: .long).attributed)

        let familyNameStyling = AttributeContainer.font(.headline)
        let familyName = AttributeContainer.personNameComponent(.familyName)
        result.replaceAttributes(familyName, with: familyNameStyling)

        return result
    }
    
    var anotherMessage: AttributedString {
        var amount = Measurement(value: 200, unit: UnitLength.kilometers)
        var result = amount.formatted(.measurement(width: .wide).attributed)

        let distanceStyling = AttributeContainer.font(.title)
        let distance = AttributeContainer.measurement(.value)
        result.replaceAttributes(distance, with: distanceStyling)

        return result
    }
    
    var body: some View {
        List {
            Section {
                Text(message1 + message2)
            }
            
            Section {
                Text(message)
            }
            
            Section {
                Text(attachTappableLink)
            }
            
            Section {
                Text(messageVoice)
            }
            
            Section {
                Text(messageDate)
            }
            
            Section {
                Text(messagePeople)
            }
            Section {
                Text(anotherMessage)
            }
        }
    }
}

#Preview {
    AdvancedTextStyling()
}
