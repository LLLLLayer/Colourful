//
//  SettingsView.swift.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Section(
                header: HStack {
                    Text("App Icon")
                        .font(.title)
                        .bold()
                    Spacer()
                }
            ) {
                IconChooserView()
            }
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
