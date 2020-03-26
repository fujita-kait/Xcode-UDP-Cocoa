//
//  ContentView.swift
//  UDP-Cocoa
//
//  Created by 藤田 on 2020/02/28.
//  Copyright 2020 KAIT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var inSocket = InSocket()
    var outSocket = OutSocket()
    let addressTo = "224.0.23.0"
    let byteArray: [UInt8] = [0x10, 0x81, 0x00, 0x00, 0x05,0xff,0x01,0x0e,0xf0,0x01,0x62,0x01,0x80,0x00]

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("Send EL")
                    // send Binary Data
                    self.outSocket.sendBinary(Data(buffer: UnsafeBufferPointer(start: self.byteArray, count: self.byteArray.count)), address: self.addressTo)
                    }) {
                    Text("Send_EL")
                }
                Button(action: {
                    print("Clear")
                    self.inSocket.ip = ""
                    self.inSocket.dataString = ""
                }) {
                    Text("Clear")
                }
            }
            Text("IP: \(inSocket.ip)")
            Text("Data: \(inSocket.dataString)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
