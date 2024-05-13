//
//  OffsetKey.swift
//  Task Manager
//
//  Created by Beyond Wealth on 13/5/2567 BE.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
