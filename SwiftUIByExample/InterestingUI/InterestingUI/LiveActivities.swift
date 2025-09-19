//
//  AlarmKit.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/09/25.
//

import AlarmKit
import SwiftUI
import AppIntents

@available(iOS 26.0, *)
struct LiveActivities: View {
    @State private var isAuthorized: Bool = false
    @State private var scheduleDate: Date = .now
    var body: some View {
        NavigationStack {
            Group {
                if isAuthorized {
                    AlarmView()
                } else {
                    Text("You need to allow alarm in setting to use this app")
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .glassEffect()
                }
            }
            .navigationTitle("Alarm Kit")
        }
        .task {
            do {
                try await checkAndAuthorize()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @ViewBuilder
    func AlarmView() -> some View {
        List {
            Section("Date And Time") {
                DatePicker("", selection: $scheduleDate, displayedComponents: [.date, .hourAndMinute])
            }
            
            Button("Set Alarm") {
                Task {
                    do {
                        try await setAlarm()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Set CountDown Alarm") {
                Task {
                    do {
                        try await setAlarmWithCountDown()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    private func setAlarm() async throws {
        /// Alarm ID
        let id = UUID()
        
        /// Secondari Alert Button
        let secondaryButton = AlarmButton(text: "Go to App", textColor: .white, systemImageName: "app.fill")
        
        /// Alert
        let alert = AlarmPresentation.Alert (
            title: "Time's Up!!!",
            stopButton: .init(text: "Stop", textColor: .red, systemImageName: "stop.fill"),
            secondaryButton: secondaryButton,
            secondaryButtonBehavior: .custom
        )
        
        /// Presentation
        let presentation = AlarmPresentation(alert: alert)
        
        /// Attribute
        let attributes = AlarmAttributes<CountDownAttribute>(presentation: presentation, metadata: .init(), tintColor: .orange)
        
        /// Schedule
        let schedule = Alarm.Schedule.fixed(scheduleDate)

        /// Configuration
        let config = AlarmManager.AlarmConfiguration(
            schedule: schedule,
            attributes: attributes,
            secondaryIntent: OpenAppIntent(id: id)
        )

        /// Adding alarm to the System
        let _ = try await AlarmManager.shared.schedule(id: id, configuration: config)
        print("Alarm Set Successfully")
    }
    private func setAlarmWithCountDown() async throws {
        /// Alarm ID
        let id = UUID()
        
        /// CountDown
        let alarmCountDown = Alarm.CountdownDuration(preAlert: 20, postAlert: 10)
        
        /// Secondari Alert Button
        let secondaryButton = AlarmButton(text: "Repeat", textColor: .white, systemImageName: "arrow.clockwise")
        
        /// Alert
        let alert = AlarmPresentation.Alert (
            title: "Time's Up!!!",
            stopButton: .init(text: "Stop", textColor: .red, systemImageName: "stop.fill"),
            secondaryButton: secondaryButton,
            secondaryButtonBehavior: .countdown
        )
        
        let countDownPresentation = AlarmPresentation.Countdown(
            title: "Coding",
            pauseButton: .init(
                text: "Pause", textColor: .white, systemImageName: "pause.fill"
            )
        )
        
        let pausedPresentation = AlarmPresentation.Paused(
            title: "Paused!",
            resumeButton: .init(
                text: "Resume", textColor: .white, systemImageName: "play.fill"
            )
        )
        
        /// Presentation
        let presentation = AlarmPresentation(alert: alert, countdown: countDownPresentation, paused: pausedPresentation)
        
        /// Attribute
        let attributes = AlarmAttributes<CountDownAttribute>(presentation: presentation, metadata: .init(), tintColor: .orange)

        /// Configuration
        let config = AlarmManager.AlarmConfiguration(
            countdownDuration: alarmCountDown,
            attributes: attributes,
        )

        /// Adding alarm to the System
        let _ = try await AlarmManager.shared.schedule(id: id, configuration: config)
        print("Alarm Set Successfully")
    }

    
    private func checkAndAuthorize() async throws {
        switch AlarmManager.shared.authorizationState {
        case .notDetermined :
            let status = try await AlarmManager.shared.requestAuthorization()
            isAuthorized = status == .authorized
        case .denied :
            isAuthorized = false
        case .authorized :
            isAuthorized = true
        @unknown default :
            fatalError()
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        LiveActivities()
    } else {
        // Fallback on earlier versions
    }
}

struct OpenAppIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "Opens App"
    static var openAppWhenRun: Bool = true
    static var isDiscoverable: Bool = false

    @Parameter
    var id: String

    init(id: UUID) {
        self.id = id.uuidString
    }
    
    init() { }

    func perform() async throws -> some IntentResult {
        if let alarmID = UUID(uuidString: id) {
            print(alarmID)
            /// Do your custom code here...
        }
        
        return .result()
    }
}
