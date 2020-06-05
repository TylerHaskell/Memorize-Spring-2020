//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Haskell, Tyler on 5/31/20.
//  Copyright © 2020 Tyler Haskell. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
