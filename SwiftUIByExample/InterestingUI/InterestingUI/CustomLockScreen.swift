//
//  CustomLockScreen.swift
//  InterestingUI
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CustomLockScreen: View {
    @State var enteredPassword = ""
    @State var isPasswordCorrect = false
    @State var shakeOffset: CGFloat = 0
    let secretPassword = "1234"

    var body: some View {
        if isPasswordCorrect {
            Text("Hello")
        } else {
            VStack {
                Spacer()
                
                /// Here we add User Profile
                UserProfile()
                
                Spacer()
                
                PasswordFiled()
                
                Spacer()
                
                KeypadView(enteredPassword: $enteredPassword, style: .Circle, secretCode: secretPassword, isPasswordCorrect: $isPasswordCorrect, shakeOffset: $shakeOffset)
                    .offset(x: shakeOffset)
                    .animation(.linear, value: shakeOffset)
            }
        }
    }

    @ViewBuilder
    func UserProfile() -> some View {
        ZStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 80, height: 80)
        }
        
        Text("John, enter your pin")
            .font(.headline)
            .offset(y: 10)
    }
    
    @ViewBuilder
    func PasswordFiled() -> some View {
        HStack(spacing: 20) {
            ForEach(0..<secretPassword.count, id: \.self) { index in
                Circle()
                    .foregroundStyle(index < enteredPassword.count ? .black : .gray.opacity(0.2))
                    .frame(width: 15, height: 15)
            }
        }
        .offset(y: 10.0)
    }

}

/// Di sini kita tambahkan enum untuk gaya tombol Keypad agar kita bisa dengan mudah mengubah gaya
enum KeypadStyle {
    case Circle
    case Square
    case Regular
}

/// Sekarang kita buat keypad kustom
struct KeypadView: View {
    @Binding var enteredPassword: String
    let style: KeypadStyle // Asumsi 'KeypadStyle' di sini
    let secretCode: String

    @Binding var isPasswordCorrect: Bool
    @Binding var shakeOffset: CGFloat

    let numbersPad = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "delete.left"]
    ]

    var body: some View {
        VStack {
            ForEach(numbersPad, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button {
                            /// Di sini kita tambahkan getaran saat pengguna mengklik tombol
                            UIImpactFeedbackGenerator(style: .medium)
                                .impactOccurred()

                            switch item {
                            case "delete.left":
                                // Menghapus karakter terakhir jika enteredPassword tidak kosong
                                if !enteredPassword.isEmpty {
                                    enteredPassword.removeLast()
                                }
                            default:
                                // Menambahkan item ke enteredPassword
                                enteredPassword.append(item)
                            }

                            // Memeriksa apakah panjang password sudah sesuai
                            if enteredPassword.count == secretCode.count {
                                // Memeriksa apakah password benar
                                if enteredPassword == secretCode {
                                    isPasswordCorrect = true
                                } else {
                                    shakeOffset = 7// Mengatur offset untuk efek getar
                                    
                                    /// Di sini kita membuat perangkat bergetar saat password salah, jadi kita tambahkan Feedback Generator
                                    UIImpactFeedbackGenerator(style: .heavy)
                                        .impactOccurred()

                                    // Mengembalikan offset getar ke nilai negatif untuk efek getar bolak-balik
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        shakeOffset = -15
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                        shakeOffset = 0
                                        enteredPassword = ""
                                    }
                                }
                            }
                        } label: {
                            if item == "" || item == "delete.left" {
                                Image(systemName: item)
                                    .font(.title)
                                    .frame(width: 80, height: 80)
                                    .frame(width: 100, height: 100)
                            } else {
                                Text(item)
                                    .font(.title)
                                    .frame(width: 80, height: 80)
                                    .background(.gray)
                                    .clipShape(.rect(cornerRadius: 50))
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
                .tint(.primary)
            }
        }
    }
    
    @ViewBuilder
    func backgroundShape(for style: KeypadStyle) -> some View {
        switch style {
        case .Circle:
            Circle()
                .fill(.gray.opacity(0.2))
        case .Square:
            RoundedRectangle(cornerRadius: 12)
                .fill(.green.opacity(0.2))
        case .Regular:
            Color.clear
        }
    }
}

#Preview {
    CustomLockScreen()
}
