//
//  Array+Only.swift
//  Memorize
//
//  Created by Haskell, Tyler on 6/4/20.
//  Copyright © 2020 Tyler Haskell. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
