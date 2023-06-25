//
//  ToDoListView.swift
//  RealmSwiftUI
//
//  Created by Andres Gutierrez on 6/25/23.
//

import SwiftUI
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @FocusState private var focus: Bool?
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New ToDo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button {
                        // Action
                        let newToDo = ToDo(name: name)
                        $toDos.append(newToDo)
                        name = ""
                        focus = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(name.isEmpty)
                }
                .padding()
                
                List {
                    ForEach(toDos, id: \.self) { toDo in
                        Text(toDo.name)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Realm ToDos")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
