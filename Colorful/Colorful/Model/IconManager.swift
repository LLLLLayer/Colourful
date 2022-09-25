//
//  IconManager.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import UIKit
import Combine

final class IconManager: ObservableObject {
    
    static let shared = IconManager()
    
    let icons: [Icon]
    
    @Published private(set) var currentIcon: Icon?
    
    init() {
        let currentIconName = UIApplication.shared.alternateIconName
        self.icons = {
            guard let plistIcons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any] else {
                return  []
            }
            var icons: [Icon] = []
            // 添加主要图标
            if let primaryIcon = plistIcons["CFBundlePrimaryIcon"] as? [String: Any],
               let files = primaryIcon["CFBundleIconFiles"] as? [String],
               let fileName = files.first {
                icons.append(Icon(ordinal: 0, name: nil, imageName: fileName))
            }
            // 添加备用图标
            if let alternateIcons = plistIcons["CFBundleAlternateIcons"] as? [String: Any] {
                icons += alternateIcons.compactMap { key, value in
                    guard let alternateIcon = value as? [String: Any],
                          let files = alternateIcon["CFBundleIconFiles"] as? [String],
                          let fileName = files.first,
                          let ordinal = alternateIcon["ordinal"] as? Int else {
                        return nil
                    }
                    return Icon(ordinal: ordinal, name: key, imageName: fileName)
                }
                .sorted()
            }
            return icons
        }()
        currentIcon = icons.first { $0.name == currentIconName }
    }
}

extension IconManager {
    @MainActor func set(icon: Icon) async throws {
        do {
            try await UIApplication.shared.setAlternateIconName(icon.name)
            currentIcon = icon
        } catch {
            throw error
        }
    }
}
