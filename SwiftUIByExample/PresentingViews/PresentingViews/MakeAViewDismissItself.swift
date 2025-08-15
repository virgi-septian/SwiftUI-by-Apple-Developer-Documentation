//
//  MakeAViewDismissItself.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct DismissingView1: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss Me") {
            dismiss()
        }
    }
}

struct DismissingView2: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss Me") {
            isPresented = false
        }
    }
}

struct MakeAViewDismissItself: View {
    @State private var showingDetail = false
    @State private var showingDetail2 = false
    var body: some View {
        /// The first option is to tell the view to dismiss itself using its presentation mode environment key. Any view can dismiss itself, regardless of how it was presented, using @Environment(\.dismiss), and calling that property as a function will cause the view to be dismissed.
        
        /// For example, we could create a detail view that is able to dismiss itself using its presentation mode environment key, and present that from ContentView;
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView1()
        }
        
        
        /// Opsi lainnya adalah meneruskan binding ke tampilan yang ditampilkan, sehingga dapat mengubah nilai binding kembali menjadi false. Anda tetap memerlukan semacam properti status di tampilan presentasi, tetapi sekarang Anda meneruskannya ke tampilan detail sebagai binding.
        
        /// Dengan menggunakan pendekatan ini, pengaturan tampilan detail yang mengikat ke false juga memperbarui status di tampilan asli, yang menyebabkan tampilan detail ditutup – baik tampilan detail maupun titik tampilan asli ke nilai Boolean yang sama, jadi mengubah yang satu akan mengubahnya di tempat yang lain juga.
        Button("Show Detail") {
            showingDetail2 = true
        }
        .sheet(isPresented: $showingDetail2) {
            DismissingView2(isPresented: $showingDetail2)
        }
    }
}

#Preview {
    MakeAViewDismissItself()
}
