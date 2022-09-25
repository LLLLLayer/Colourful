//
//  Icon.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import UIKit

struct Icon: Identifiable {
    var id: String { imageName }
    let ordinal: Int
    let name: String?
    let imageName: String
    var image: UIImage {
        .init(named: imageName) ?? .init()
    }
}

extension Icon: Comparable {
    static func < (lhs: Icon, rhs: Icon) -> Bool {
        lhs.ordinal < rhs.ordinal
    }
}
