# Readme UDP-Cocoa
2020.02.27 Hiroyuki Fujita

## 1. Summary  
このプログラムは、iOSでUDPの送受信を行うライブラリCocoaAsyncSocketのサンプルプログラムである。  
受信PORTは**3610**、マルチキャストアドレス**224.0.23.0**のグループに参加。
GUIをSwiftUIで作成。

## 2. 環境
Xcode. 11.3.1, 
iOS13.3 (SwiftUIを利用するのでiOS 13が必須）


## 3. 機能
- UDPを受信すると、送信元のIP addressとそのデータをバイナリで表示する。
    - IP addressは16byteのバイナリで表示される。5 ~8 バイト目がIPv4のアドレス。
- SendEL ボタンをタップすると、マルチキャストアドレス宛に以下のバイナリデータを送信する
    - 1081 0000 05FF01 0EF001 62 01 80 00
    - マルチキャストで受信するので、アドレスとデータが表示される
- Clearボタンをタップすると、表示されているIPアドレスとデータがクリアされる
- 送信と受信データはXcodeのコンソールにも表示される

## 4. 利用方法
このサンプルプログラムを利用する場合は、CocoaAsyncSocketをcocoapodsを利用してimportする必要がある。詳細は[CocoaAsyncSocket.md](CocoaAsyncSocket.md)を参照のこと。

## 5. ソースコードの解説
UDPで受信した場合、自動で画面表示をアップデートする。SwiftUIを利用した場合、property observerの作りは以下のようになっている。<br>
ContentView（画面表示）側では、observeするpropertyを

```
@ObservedObject var inSocket = InSocket()
```

と定義する。以下の **inSocket.dataString** が自動で更新される。

```
Text("Data: \(inSocket.dataString)")
```

モデル側では、クラス定義に **ObservableObject** プロトコルを追加し、observeされるpropertyの定義には **@Published** というキーワードをつける。

```
class InSocket: NSObject, GCDAsyncUdpSocketDelegate, ObservableObject {
    @Published var ip = ""
    @Published var dataString = ""
```



## 6. Note
SSNG for iPhoneをリファクタリングする際、iOS12で導入されたNetwork Frameworkを試したが、UDP受信でマルチキャストがまだ使えないことがわかり、結局CocoaAsyncSocketを利用することになった。