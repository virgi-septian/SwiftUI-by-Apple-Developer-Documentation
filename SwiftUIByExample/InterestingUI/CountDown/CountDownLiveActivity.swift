//
//  CountDownLiveActivity.swift
//  CountDown
//
//  Created by Virgi Septian on 19/09/25.
//

import ActivityKit
import WidgetKit
import SwiftUI
import AlarmKit
import AppIntents


struct CountDownLiveActivity: Widget {
    /// Number Formatter
    @State private var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AlarmAttributes<CountDownAttribute>.self) { context in
            HStack{
                // Title
                VStack {
                    switch context.state.mode {
                    case .countdown(let countdown):
                        Group {
                            Text(context.attributes.presentation.countdown?.title ?? "")
                                .font(.title3)
                            Text(countdown.fireDate, style: .timer)
                                .font(.title2)
                        }
                    case .paused(let paused):
                        Group {
                            Text(context.attributes.presentation.paused?.title ?? "")
                                .font(.title3)
                            
                            Text(formatter.string(from: paused.totalCountdownDuration - paused.previouslyElapsedDuration) ?? "0:00")
                                .font(.title2)
                        }
                    case .alert(_):
                        Text(context.attributes.presentation.alert.title)
                            .font(.title3)
                        
                        Text("0:00")
                            .font(.title2)
                    @unknown default:
                        fatalError()
                    }
                }
                .lineLimit(1)
                
                Spacer(minLength: 0)
                
                let alarmID = context.state.alarmID
                /// Pause and Cancel Buttons!
                Group {
                    if case .paused = context.state.mode {
                        /// Resume Button
                        Button(intent: AlarmActionIntent(id: alarmID, isCancel: false, isResume: true)) {
                            Image(systemName: "play.fill")
                        }
                        .tint(.orange)
                    } else {
                        Button(intent: AlarmActionIntent(id: alarmID, isCancel: false)) {
                            Image(systemName: "pause.fill")
                        }
                        .tint(.orange)
                    }
                    
                    Button(intent: AlarmActionIntent(id: alarmID, isCancel: false)) {
                        Image(systemName: "xmark")
                    }
                    .tint(.red)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
                .font(.title)
            }
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Minimal Content")
            }
            .keylineTint(Color.red)
        }
    }
}


