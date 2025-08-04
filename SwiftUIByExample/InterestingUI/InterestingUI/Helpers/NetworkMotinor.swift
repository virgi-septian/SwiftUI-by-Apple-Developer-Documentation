//
//  NetworkMotinor.swift
//  InterestingUI
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI
import Network

extension EnvironmentValues {
    @Entry var isNetworkConnected: Bool?
    @Entry var connectionType: NWInterface.InterfaceType?
}

class NetworkMonitor: ObservableObject {
    @Published var isConnected: Bool?
    @Published var connectionType: NWInterface.InterfaceType?

    /// Monitor Properties
    private var queue = DispatchQueue(label: "Monitor")
    private var monitor = NWPathMonitor()

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            
            // Asumsikan ini dijalankan di MainActor karena mengubah @Published
            Task { @MainActor in
                self.isConnected = path.status == .satisfied
                
                let types: [NWInterface.InterfaceType] = [.wifi, .cellular, .wiredEthernet, .loopback]
                if let type = types.first(where: { path.usesInterfaceType($0) }) {
                    self.connectionType = type
                } else {
                    self.connectionType = nil
                }
            }
        }
        
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        // Implementasi untuk menghentikan monitoring
    }
}
