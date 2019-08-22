//
//  ListSelectionManager.swift
//  SwiftUI Core Data Test
//
//  Created by Chuck Hartman on 8/5/19.
//  Copyright © 2019 ForeTheGreen. All rights reserved.
//

import Foundation

extension ListSelectionManager {
    subscript(member: T) -> Bool {
        get {
            return self.isSelected(member)
        }
        set {
            if newValue {
                self.select(member)
            } else {
                self.deselect(member)
            }
        }
    }
}

class ListSelectionManager<T: Hashable>: ObservableObject {
    
    @Published var selection: Set<T> = Set<T>()
    
    func select(_ value: T) {
        self.selection.insert(value)
    }
    
    func deselect(_ value: T) {
        self.selection.remove(value)
    }
    
    func isSelected(_ value: T) -> Bool {
        return self.selection.contains(value)
    }
}

