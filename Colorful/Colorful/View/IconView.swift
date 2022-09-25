//
//  IconView.swift
//  Colorful
//
//  Created by yangjie.layer on 2022/9/25.
//

import SwiftUI

struct IconView: View {
    let icon: Icon
    var selected: Bool
    
    var body: some View {
        Image(uiImage: icon.image)
          .renderingMode(.original)
          .cornerRadius(10)
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 2)
          )
          .padding([.trailing], 2)
          .if(selected) {
            $0.overlay(
              Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.green),
              alignment: .bottomTrailing
            )
          }
    }
}

struct IconView_Previews: PreviewProvider {
    static let darkIcon = Icon(ordinal: 0, name: nil, imageName: "app-icon--default")
    static let lightIcon = Icon(ordinal: 0, name: "black-white", imageName: "app-icon--black-white")
    static var previews: some View {
        HStack {
          IconView(icon: darkIcon, selected: false)
          IconView(icon: darkIcon, selected: true)
          IconView(icon: lightIcon, selected: false)
          IconView(icon: lightIcon, selected: true)
        }
    }
}
