# SwiftのProjectでCocoaAsyncSocketのインストール方法

2017.07.10 by Hiro Fujita  
(Xcode 8.3.3で動作確認)
2020.02.21 update

### 1. Cocoapodsのinstall

```
$ sudo gem install cocoapods  
$ pod --version  
1.8.4  
```

### 2. XcodeでProject作成
サンプルプロジェクトの名前をUdp-01とする。

- Xcodeを起動  
- create a new project  
- Single View Application  (Next)
- Product Name: Udp-01  
- Uncheck "Include Unit Tests", "Include UI Tests" (Next)  
- Select folder (Create)  
- SimulatorでiPhoneを選んでBuild -> Simulator上でアプリが起動することを確認  
- Xcode終了  

### 3. CocoaAsyncSocketのinstall

- Udp-01.xcodeprojがあるfolderを開く  
- Terminalを起動し、以下のコマンドを入力する  

```
$ cd <Udp-01.xcodeprojがあるfolderのpath>  
$ pod init  
```

- Podfileというファイルが作成されるので、Editorで開く  
(note: テキストエディットを使用してはいけない）  

```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Udp-01' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Udp-01

end
```

- \# Pods for Udp-01  の次の行に pod 'CocoaAsyncSocket' を追加する。

```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Udp-01' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Udp-01
  pod 'CocoaAsyncSocket'

end
```

-  保存してEditorを終了する。  
- Terminalに以下のコマンドを入力する 

```
$ pod install  
```

- Udp-01.xcworkspace  というファイルが作成される。  
- Udp-01.xcworkspace をダブルクリックしてXcodeを起動。  
- 他のprojectから必要なファイルをdrag and dropでコピーする。  
- コピーしたファイルにBridging-Header.hがある場合  
Project navigatorを開き、SampleEL1のprojectを選択  
PROJECTペインのTARGETSの下のSampleEL1を選択  
Build Settingsを選択  
Scroll downしてSwift Compiler - Generalの  
Objective-C bridging headerの右側をクリックすると入力画面が現れるので、そこへProject NavigatorからBridging-Header.hをdrag and dropする。  

- Buildを実行してエラーがないことを確認  



