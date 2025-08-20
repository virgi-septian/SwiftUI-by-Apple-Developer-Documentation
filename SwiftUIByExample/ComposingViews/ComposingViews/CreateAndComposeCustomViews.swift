//
//  ContentView.swift
//  ComposingViews
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

/// One of the core tenets of SwiftUI is composition, which means it’s designed for us to create many small views then combine them together to create something bigger. This allows us to re-use views on a massive scale, which means less work for us. Even better, combining small subviews has almost no runtime overhead, so we can use them freely.

struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}

struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct EmailAddress: View {
    var address: String

    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct EmployeeDetails: View {
    var employee: Employee

    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.largeTitle)
                .foregroundStyle(.primary)
            Text(employee.jobTitle)
                .foregroundStyle(.secondary)
            EmailAddress(address: employee.emailAddress)
        }
    }
}

struct EmployeeView: View {
    var employee: Employee

    var body: some View {
        HStack {
            ProfilePicture(imageName: employee.profilePicture)
            EmployeeDetails(employee: employee)
        }
    }
}

struct CreateAndComposeCustomViews: View {
    let employee = Employee(name: "Paul Hudson", jobTitle: "Editor, Hacking with Swift", emailAddress: "paul@hackingwithswift.com", profilePicture: "paul-hudson")

    var body: some View {
        EmployeeView(employee: employee)
    }
}

#Preview {
    CreateAndComposeCustomViews()
}
