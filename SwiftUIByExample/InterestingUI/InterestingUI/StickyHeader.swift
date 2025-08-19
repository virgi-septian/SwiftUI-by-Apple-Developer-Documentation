//
//  StickyHeader.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct StickyHeader: View {
    var body: some View {
        ScrollView {
            VStack {
                // Panggilan ke fungsi tampilan gambar
                imageView()
                
                GeometryReader { geo in
                    let minY = geo.frame(in: .global).minY

                    HStack(spacing: 10) {
                        Button {
                            // Aksi
                        } label: {
                            Label("message", systemImage: "message")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(.black, in: RoundedRectangle(cornerRadius: 20))
                        }

                        Button(action: {}) {
                            Image(uiImage: .add)
                                .resizable()
                                .foregroundStyle(.white)
                                .scaledToFill()
                                .frame(width: 14, height: 14)
                                .padding()
                                .background(.black, in: Circle())
                        }
                        
                        Button(action: {}) {
                            Image(uiImage: .checkmark)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 14, height: 14)
                                .padding()
                                .background(.black, in: Circle())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: max(60 - minY, 0))
                }
                .offset(y: -44)
                .zIndex(1)
                
                GridView()
            }
        }
        .ignoresSafeArea()
    }
}

struct GridView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
            ForEach(0..<25) { item in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 220)
                    .foregroundStyle(.ultraThinMaterial)
            }
        }
        .padding(.horizontal, 10)
    }
}


@ViewBuilder
func imageView() -> some View {
    GeometryReader { geo in
        let minY = geo.frame(in: .global).minY
        let isScrolling = minY > 0

        VStack {
            Image(.pic1)
                .resizable()
                .scaledToFill()
                .frame(height: isScrolling ? 180 + minY : 180)
                .clipped()
                .offset(y: isScrolling ? -minY : 0)
                .blur(radius: isScrolling ? 0 + minY / 80 : 0)
                .overlay(alignment: .bottom) {
                    // Perhatikan: 'Alignment' dan 'View' harus diganti dengan nilai yang tepat
                    ZStack {
                        Image(.profile)
                            .resizable()
                            .scaledToFill()
                        
                        Circle().stroke(lineWidth: 6)
                    }
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .offset(y: 50)
                    .offset(y: isScrolling ? -minY : 0)
                }
            
            Group {
                VStack(spacing: 6) {
                    Text("Jonh Doe")
                        .bold()
                        .padding(.top, 50)
                        .font(.title)

                    Text("Alexia Ray is a 3D artist with 5+ years of experience, specializing in vibrant environmenets and characters using Blender and Maya.")
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width - 30) // Lebar view disesuaikan dengan lebar layar dikurangi padding
                        .lineLimit(3) // Membatasi teks hingga 3 baris
                        .fixedSize() // Mengabaikan batas layout dan menggunakan ukuran yang dibutuhkan
                }
            }
            .offset(y: isScrolling ? -minY : 0) // Menggeser view ke atas saat scrolling
            .padding()

        }
    }
    .frame(height: 395)
}

#Preview {
    StickyHeader()
}
