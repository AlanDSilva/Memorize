//
//  Array+Only.swift
//  Memorize
//
//  Created by Alan on 1.5.2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
