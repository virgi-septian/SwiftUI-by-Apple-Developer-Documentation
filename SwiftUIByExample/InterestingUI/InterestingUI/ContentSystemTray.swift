//
//  ContentSystemTray.swift
//  InterestingUI
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

enum CurentView {
    case actions
    case periods
    case keypad
}

struct ContentSystemTray: View {
    @State private var show: Bool = false
    @State private var currentView: CurentView = .actions
    @State private var selectedAction: Action?
    @State private var selectedPeriod: Period?
    @State private var duration: String = ""
    var body: some View {
        Button("Show Tray View") {
            show.toggle()
        }
        .systemTrayView($show) {
            VStack(spacing: 20) {
                ZStack {
                    switch currentView {
                    case .actions:
                        View1()
                            .transition(.blurReplace)
                    case .periods:
                        View2()
                            .transition(.blurReplace)
                    case .keypad:
                        View3()
                            .transition(.blurReplace)
                    }
                }
                .compositingGroup()
                
                /// Continue Button
                Button {
                    withAnimation(.bouncy) {
                        currentView = .periods
                    }
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .foregroundStyle(.white)
                        .background(.blue, in: .capsule)
                }
                .padding(.top, 15)
            }
            .padding(20)
        }
    }
    
    /// View 1
    @ViewBuilder
    func View1() -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Choose Subscription")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer(minLength: 0)

                Button {
                    // Aksi tombol
                    show = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1)) // Menggunakan dua warna foreground
                }
            }
            .padding(.bottom, 10)

            /// Custom Checkbox Menu
            ForEach(actions) { action in
                let isSelected = selectedAction?.id == action.id

                HStack(spacing: 10) {
                    Image(systemName: action.image)
                        .font(.title)
                        .frame(width: 40)

                    Text(action.title)
                        .fontWeight(.semibold)

                    Spacer(minLength: 0)

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
                        .font(.title)
                        .contentTransition(.symbolEffect)
                        .foregroundStyle(isSelected ? Color.blue : Color.gray.opacity(0.2))
                }
                .padding(.vertical, 6)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedAction = isSelected ? nil : action
                    }
                }
            }
        }
    }
    
    func View2() -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Choose Period")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer(minLength: 0)

                Button {
                    // Aksi tombol
                    withAnimation(.bouncy) {
                        currentView = .actions
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1)) // Menggunakan dua warna foreground
                }
            }
            .padding(.bottom, 25)
            
            Text("Choose the period you want\nto get subscription")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding(.bottom, 20)

            /// Grid Box View
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15) {
                ForEach(periods) { period in
                    let isSelected = selectedPeriod?.id == period.id
                    
                    VStack(spacing: 6) {
                        Text(period.title)
                            .font(period.value == 0 ? .title3 : .title2)
                            .fontWeight(.semibold)
                        
                        if period.value != 0 {
                            Text(period.value == 1 ? "Month" : "Months")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(isSelected ? .blue : .gray).opacity(isSelected ? 0.2 : 0.1)
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            if period.value == 0 {
                                currentView = .keypad
                            } else {
                                selectedPeriod = isSelected ? nil : period
                            }
                        }
                    }
                }
            }
        }
    }
    
    func View3() -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Custom Duration")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer(minLength: 0)

                Button {
                    // Aksi tombol
                    withAnimation(.bouncy) {
                        currentView = .periods
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1)) // Menggunakan dua warna foreground
                }
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 6) {
                Text(duration.isEmpty ? "0" : duration)
                    .font(.system(size: 60, weight: .black))
                    .contentTransition(.numericText())
                    
                Text("Days")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 20)

            /// Grid Box View
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15) {
                ForEach(keypadValues) { keyValue in
                    Group {
                        // Jika tombol adalah tombol kembali, tampilkan gambar
                        if keyValue.isBack {
                            Image(systemName: keyValue.title)
                        } else {
                            // Jika bukan, tampilkan teks
                            Text(keyValue.title)
                        }
                    }
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            // Jika tombol adalah tombol kembali
                            if keyValue.isBack {
                                // Hapus karakter terakhir dari durasi jika tidak kosong
                                if !duration.isEmpty {
                                    duration.removeLast()
                                }
                            } else {
                                // Tambahkan judul tombol ke durasi
                                duration.append(keyValue.title)
                            }
                        }
                    }

                }
            }
            .padding(.horizontal, 15)
        }
    }
}


#Preview {
    ContentSystemTray()
}

