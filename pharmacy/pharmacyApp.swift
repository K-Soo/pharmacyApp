//
//  pharmacyApp.swift
//  pharmacy
//
//  Created by admin on 2024/03/09.
//

import SwiftUI
import KakaoMapsSDK

@main
struct pharmacyApp: App {

  init() {
    SDKInitializer.InitSDK(appKey: "a3262271c54e54390f3db6cd37c189c2")
  }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
