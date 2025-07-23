//
//  DragDropList.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct DragDropList: View {
    /// Sample Tasks
    @State private var todo: [Task] = [
        .init(title: "Edit Video!", status: .todo)
    ]
    @State private var working: [Task] = [
        .init(title: "Record Video", status: .working)
    ]
    @State private var completed: [Task] = [
        .init(title: "Implement Drag & Drop", status: .completed),
        .init(title: "Update Mockview App!", status: .completed),
    ]

    /// View Properties
    @State private var currentlyDragging: Task?
    var body: some View {
        HStack(spacing: 2) {
            TodoView()
                

            WorkingView()
                

            CompletedView()

        }
    }
    /// Tasks View
    @ViewBuilder
    func TasksView(_ tasks: [Task]) -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            ForEach(tasks) { task in
                GeometryReader {
                    /// Task Row
                    TaskRow(task, $0.size)
                }
                .frame(height: 45)
            }
        })
        .frame(maxHeight: .infinity)
        .padding()
    }

    /// Task Row
    @ViewBuilder
    func TaskRow(_ task: Task, _ size: CGSize) -> some View {
        Text(task.title)
            .font(.callout)
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: size.height)
            .background(.white, in: .rect(cornerRadius: 10))
            .contentShape(.dragPreview, .rect(cornerRadius: 10))
            .draggable(task.id.uuidString) {
                Text(task.title)
                    .font(.callout)
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: size.height)
                    .background(.white)
                    .contentShape(.dragPreview, .rect(cornerRadius: 10))
                    .onAppear(perform: {
                        currentlyDragging = task
                    })
            }
            .dropDestination(for: String.self) { items, location in
                currentlyDragging = nil
                return false
            } isTargeted: { status in
                if let currentlyDragging, status, currentlyDragging.id != task.id {
                    appendTask(task.status)
                    
                    switch task.status {
                    case .todo:
                        replaceItem(tasks: &todo, droppingTask: task, status: .todo)
                    case .working:
                        replaceItem(tasks: &working, droppingTask: task, status: .working)
                    case .completed:
                        replaceItem(tasks: &completed, droppingTask: task, status: .completed)
                    }
                }
            }
    }
    
    /// Menambahkan dan Menghapus task dari satu List ke List lainnya
    func appendTask(_ status: Status) {
        if let currentlyDragging { // Asumsi 'currentlyDragging' adalah variabel yang menyimpan Task yang sedang di-drag
            switch status {
            case .todo:
                /// Safe Check dan Memasukkan ke List
                if !todo.contains(where: { $0.id == currentlyDragging.id }) {
                    /// Memperbarui Statusnya
                    var updatedTask = currentlyDragging
                    updatedTask.status = .todo
                    /// Menambahkan ke List
                    todo.append(updatedTask)
                    /// Menghapusnya dari semua List lainnya
                    working.removeAll(where: { $0.id == currentlyDragging.id })
                    completed.removeAll(where: { $0.id == currentlyDragging.id })
                }
            case .working:
                /// Safe Check dan Memasukkan ke List
                if !working.contains(where: { $0.id == currentlyDragging.id }) {
                    /// Memperbarui Statusnya
                    var updatedTask = currentlyDragging
                    updatedTask.status = .working
                    /// Menambahkan ke List
                    working.append(updatedTask)
                    /// Menghapusnya dari semua List lainnya
                    todo.removeAll(where: { $0.id == currentlyDragging.id })
                    completed.removeAll(where: { $0.id == currentlyDragging.id })
                }
                break // Tambahkan implementasi untuk case .working
            case .completed:
                /// Safe Check dan Memasukkan ke List
                if !completed.contains(where: { $0.id == currentlyDragging.id }) {
                    /// Memperbarui Statusnya
                    var updatedTask = currentlyDragging
                    updatedTask.status = .completed
                    /// Menambahkan ke List
                    completed.append(updatedTask)
                    /// Menghapusnya dari semua List lainnya
                    working.removeAll(where: { $0.id == currentlyDragging.id })
                    todo.removeAll(where: { $0.id == currentlyDragging.id })
                }
                break // Tambahkan implementasi untuk case .completed
            }
        }
    }

    
    /// Mengganti Item dalam List
    func replaceItem(tasks: inout [Task], droppingTask: Task, status: Status) {
        if let currentlyDragging { // Asumsi 'currentlyDragging' adalah variabel yang menyimpan Task yang sedang di-drag
            if let sourceIndex = tasks.firstIndex(where: { $0.id == currentlyDragging.id }),
               let destinationIndex = tasks.firstIndex(where: { $0.id == droppingTask.id }) {
                /// Menukar Item dalam List
                var sourceItem = tasks.remove(at: sourceIndex) // Hapus item dari posisi awal
                sourceItem.status = status // Perbarui status item yang dipindahkan
                tasks.insert(sourceItem, at: destinationIndex) // Sisipkan kembali di posisi baru
            }
        }
    }
    
    /// Todo View
    @ViewBuilder
    func TodoView() -> some View {
        NavigationStack {
            ScrollView(.vertical){
                TasksView(todo)
            }
            .navigationTitle("Todo View")
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                /// Menambahkan ke bagian terakhir dari Current List, jika item tidak ada di list tersebut
                withAnimation(.snappy) {
                    appendTask(.todo)
                }
                return true
            } isTargeted: { _ in

            }
        }
    }
    
    /// Working View
    @ViewBuilder
    func WorkingView() -> some View {
        NavigationStack {
            ScrollView(.vertical){
                TasksView(working)
            }
            .navigationTitle("Working View")
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                /// Menambahkan ke bagian terakhir dari Current List, jika item tidak ada di list tersebut
                withAnimation(.snappy) {
                    appendTask(.working)
                }
                return true
            } isTargeted: { _ in

            }
        }
    }
    
    /// Completed View
    @ViewBuilder
    func CompletedView() -> some View {
        NavigationStack {
            ScrollView(.vertical){
                TasksView(completed)
            }
            .navigationTitle("Completed View")
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                /// Menambahkan ke bagian terakhir dari Current List, jika item tidak ada di list tersebut
                withAnimation(.snappy) {
                    appendTask(.completed)
                }
                return true
            } isTargeted: { _ in

            }
        }
    }
}


#Preview {
    DragDropList()
}
