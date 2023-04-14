//
//  TodoData.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import Foundation

struct TodoData: Hashable {
    let id: String = UUID().uuidString
    var todo: String
    var time: Int
}

class TodoList: ObservableObject {
    var todoItems = [TodoData]()
    
    init(todoItems: [TodoData] = [TodoData]()) {
        self.todoItems = todoItems
    }
    func addItem(_ todo: TodoData) {
        self.todoItems.append(todo)
    }
}


