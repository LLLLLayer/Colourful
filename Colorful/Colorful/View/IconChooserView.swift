//
//  IconChooserView.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import SwiftUI

struct IconChooserView: View {
    @StateObject var iconManager = IconManager.shared
    
    var body: some View {
        HStack {
            ForEach(iconManager.icons) { icon in
                Button {
                    Task {
                        try await iconManager.set(icon: icon)
                    }
                } label: {
                    IconView(icon: icon, selected: iconManager.currentIcon == icon)
                }
            }
        }
    }
}

struct IconChooserView_Previews: PreviewProvider {
    static var previews: some View {
        IconChooserView()
    }
}
