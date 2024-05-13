//
//  NewTask.swift
//  Task Manager
//
//  Created by Beyond Wealth on 13/5/2567 BE.
//

import SwiftUI
import SwiftData
struct NewTask: View {
    
    
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle: String = ""
    @State private var taskCaption: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "taskColor 1"
//    @State private var taskColor: Color = .yellow
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading, content: {
            VStack(alignment: .leading, content: {
                Label("Add new Task", systemImage: "arrow.left")
                    .onTapGesture{
                        dismiss()
                    }
                
                VStack(spacing: 20, content: {
                    TextField("Your Task Title", text: $taskTitle)
                })
                .padding(.top)
            })
            .hSpacing(.leading)
            .padding(30)
            .frame(maxWidth: .infinity)
            .background{
                Rectangle().fill(.gray.opacity(0.1))
                    .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                    .ignoresSafeArea()
            }
            
            // Task Title
            
            VStack(alignment: .leading, spacing: 30, content: {
                VStack(spacing: 20, content: {
                    TextField("Your Task Caption", text: $taskCaption)
                    Divider()
                })
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Timeline")
                        .font(.title3)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                })
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Task Color")
                        .font(.title3)
                    
                    let colors: [String] = (1...7).compactMap { index -> String in return "taskColor \(index)"
                    }
//                    let colors: [Color] = [.yellow, .orange, .green, .blue, .indigo, .red]
                    
                    HStack(spacing: 10, content: {
                        ForEach(colors, id: \.self) { color in
                                Circle()
                                .fill(Color(color).opacity(0.4))
                                .background {
                                    Circle().stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                }
                                .hSpacing(.center)
                                .onTapGesture {
                                    withAnimation(.snappy){
                                        taskColor = color
                                    }
                                }
                        }
                    })
                })
                
            })
            .padding(30)
            .vSpacing(.top)
            
            
            Button {
                let task = Task(title: taskTitle, caption: taskCaption, date: taskDate, tint: taskColor)
                do {
                    context.insert(task)
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                    }
                
            } label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height:60)
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }
        })
        .vSpacing(.top)
    }
}

#Preview {
    NewTask()
}
