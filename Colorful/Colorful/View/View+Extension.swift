//
//  View+Extension.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<T: View>(_ conditional: Bool, transform: (Self) -> T) -> some View {
        if conditional {
            transform(self)
        } else {
            self
        }
    }
}
