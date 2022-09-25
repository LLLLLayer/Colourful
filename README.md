# 在 iOS 上实现用户主动触发的 App Icon 切换

> 在  [Emitron](https://github.com/razeware/emitron-iOS)  项目上看到一个 App Icon 切换的功能，本文将探索并实现该功能。
>
> <div data-type="transform-warn" data-index="2"> 
>
>  ![image](http://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4d2b4c354ed648d0b5c61ff268e890f0~tplv-k3u1fbpfcp-watermark.image?)
>  
> </div>



# Colourful Demo

新建 SwiftUI 项目，就叫它 Colourful 吧～

<div data-grid-img>

 ![image](http://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/fec92f13ef954a7b9599c0525c6a62e1~tplv-k3u1fbpfcp-watermark.image?)

![image](http://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/dcebbbc412804f069a8f539bb2ecbabd~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

在 ./Colorful/Colorful 文件加下，新增 App Icons 文件夹。借用一下 [Emitron](https://github.com/razeware/emitron-iOS) 的图标，将这些图标加入到 App Icons 文件夹中。每一种图标提供四张图片，分别是-ipad@2x、-ipadpro@2x、@2x、@3x。

<div data-grid-img>

 ![image](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8ff5a12e77344fbcaffb3b215af5cc09~tplv-k3u1fbpfcp-watermark.image?)

![image](http://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d4198be90f184875828960ea08eb4d1d~tplv-k3u1fbpfcp-watermark.image?)
 
</div>



## CFBundleIcons

在 info 中 添加 Icon files (iOS 5) 字段：

<div data-type="transform-warn" data-index="11"> 

 ![image](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f50c8f63efe44372a520692f6c1811fb~tplv-k3u1fbpfcp-watermark.image?)
 
</div>



右击Icon files (iOS 5) ，勾选 Raw Keys and Values。将列出原始 Key 名称，而不是展示英文本地化字符串。可以看到原始 Key 为 CFBundleIcons。

<div data-type="transform-warn" data-index="14"> 

 ![image](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/92f2a7fb37cc4391948db9a451e0e98e~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

<div data-type="transform-warn" data-index="15"> 

 ![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ff6901eda4334fc6bb63bac435a1fd76~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

### Newsstand

Newsstand 是 Apple 在 iOS5 推出的存放报刊杂志类内容的 App。在 iOS9 之后，苹果删除了这个 App，而 CFBundleIcons 下的 [UINewsstandIcon](https://www.it610.com/article/5457904.htm) 是服务于 Newsstand 的，因此我们可以删除

UINewsstandIcon 这个 Key。



### CFBundlePrimaryIcon

另一个 Key [CFBundlePrimaryIcon](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons/cfbundleprimaryicon)，用来设置 App 的主要图标。这里需要注意，如果我们已经在Assets.xcassets中，存在 AppIcon，那么CFBundlePrimaryIcon中的配置将会被忽略，Assets.xcassets的 AppIcon 将会自动配置到 CFBundlePrimaryIcon 中。

<div data-type="transform-warn" data-index="22"> 

 ![image](http://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/070c5c830fb248efbe6cdd66d2395cb4~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

*   [UIPrerenderedIcon](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons/cfbundleprimaryicon/uiprerenderedicon) 是一个布尔值，指示图标文件是否已包含光泽效果，若为 NO，Apple 会为 App 在 AppStore 和 iTunes 上展示的 icon 添加光泽。

*   [CFBundleIconName](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleiconname/) 表示应用程序图标的 asset 的名称。在 iOS 11 及更高版本通过输入 assets z中的名称进行捆绑，代表应用程序图标。如果您使用此键，您还应该在非 iOS 系统（如配置器和 MDM 解决方案）中包含至少一项，CFBundleIconFiles以便显示该图标。

*   [CFBundleIconFiles](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons/cfbundleprimaryicon/cfbundleiconfiles) 是图标文件的名称。如果面向 iOS 10 或更早版本，则是必需的字段。数组中的每个字符串都包含图标文件的名称。我们可以包含多个不同大小的图标，以支持 iPhone、iPad 和通用应用程序。



我们可以删除 assets 中的 AppIcon，同时删除 Colorful Target 下 General Tag 下的 App Icons and Launch Screen 的 AppIcon 相关内容。

<div data-grid-img>

 ![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6b9f1bd73e3e419d871f8fa06aef57bd~tplv-k3u1fbpfcp-watermark.image?)

![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f33e82cd1925473baec7d344cc70f3a4~tplv-k3u1fbpfcp-watermark.image?)
 
</div>



删除 CFBundleIconName ，并将 CFBundleIconFiles 的 item0 的值设置为图片名称 app-icon--default，来指定图标。运行项目，Colourful 的图标即被替换为对应的图标。

<div data-grid-img>

 ![image](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/77c1dbe23de847269273bc8444311016~tplv-k3u1fbpfcp-watermark.image?)

![image](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6c7ae2bfef0348e6800137408e3b7dd2~tplv-k3u1fbpfcp-watermark.image?)
 
</div>



### CFBundleAlternateIcons

&#x20;此 Key 标识 App 的备用图标，需要我们手动添加。

<div data-type="transform-warn" data-index="35"> 

 ![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3d9e7bc16fcb4ce5a8fb936b8e0c5bb7~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

UINewsstandBindingType、UINewsstandBindingEdge 如上文我们并不需要，手动进行删除。而光泽效果 UIPrerenderedIcon，需要我们手动添加。而 [Emitron](https://github.com/razeware/emitron-iOS) 的效果是多张 App Icon，因此，我们需要对 CFBundleAlternateIcons 的结构进行调整。根据 [Apple 文档](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/NaN)，在 iOS 中，CFBundleAlternateIcons 的值是一个字典。每个字典条目的键是备用图标的名称。根据我们的备用图标 black-white、white-black、multi-black、black-multi，我们调整结构如下：

<div data-type="transform-warn" data-index="37"> 

 ![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bbe030fedc2b44849722fd8b3a568db4~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

CFBundleAlternateIcons 下有四个图标，每个图标有一个标识序号的 ordinal 字段，以及 UIPrerenderedIcon 和 CFBundleIconFiles 字段。



## Colourful App

### 新增文件

新建文件 Icon.swift，表示图标：

```Swift
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
```



新建文件 IconManager.swift，它将处理图标的读取和更改，后续将继续完善：

```Swift
import UIKit
import Combine
 
final class IconManager: ObservableObject {
    
    static let shared = IconManager()
    
    let icons: [Icon]
    
    @Published private(set) var currentIcon: Icon?
    
    init() {
        self.icons = []
        // Todo
    }
}
```



新增 View+Extension.swift，添加 ViewBuilder 注解的一个便捷方法：

```Swift
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
```



新增 IconView.swift 文件，画出图标，这里用到了 **.if**：

```Swift
import SwiftUI
 
struct IconView: View {
    let icon: Icon
    let selected: Bool
    
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
```

<div data-type="transform-warn" data-index="53"> 

 ![image](http://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a695612ad07947f09dfc87290736c0b3~tplv-k3u1fbpfcp-watermark.image?)
 
</div>



新增 IconChooserView.swift，后续将展示可供更换的图标：

```Swift
struct IconChooserView: View {
    @StateObject var iconManager = IconManager.shared
    
    var body: some View {
        HStack {
            ForEach(iconManager.icons) { icon in
                Button {
                    // Todo
                } label: {
                    IconView(icon: icon, selected: iconManager.currentIcon == icon)
                }
            }
        }
    }
}
```



新增 SettingsView.swift，放置 IconChooserView：

```Swift
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
```



调整 ContentView.swift，展示 SettingsView：

```Swift
import SwiftUI
 
struct ContentView: View {
    var body: some View {
        VStack {
            SettingsView()
        }
    }
}
```



### 调整 IconManager

调整 IconManager 的 init 方法：

```Swift
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
```

这里先获取了当前图标名，由于我们的 Primary Icon 没有名字，所以 currentIconName 为空。icons 为主要图标和备用图标组成的数组。currentIcon 为当前的 Primary Icon。

运行程序，查看运行情况：

<div data-type="transform-warn" data-index="69"> 

 ![image](http://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/06b73de7789a4aecb9e63f53085e984e~tplv-k3u1fbpfcp-watermark.image?)
 
</div>

继续新增代码，完成 set 方法：

```Swift
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
```



### 调整 IconChooserView

修改代码，补充 Button 事件：

```Swift
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
```



运行项目，尝试更改图标，我们的项目就完成啦～

<div data-type="transform-warn" data-index="78"> 
 
![iShot_2022-09-25_20.59.31.gif](http://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c84d31998aa5436b960854c44f0e27d3~tplv-k3u1fbpfcp-watermark.image?)
    
</div>

> 可以从[这里](https://github.com/LLLLLayer/Colourful)获取项目的源码。
