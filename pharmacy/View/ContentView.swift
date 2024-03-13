//
//  ContentView.swift
//  pharmacy
//
//  Created by admin on 2024/03/09.
//

import SwiftUI
import XMLCoder

struct ContentView: View {
  @StateObject var weekendPharmacyModelView = WeekendPharmacyModelView()

  var appVersion: String {
    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
      return version
    }
    return "Unknown"
  }

  var body: some View {
//    VStack {
//      Text("App Version: \(appVersion)")
//    }
    TabView {
      WeekendPharmacyView()
        .environmentObject(weekendPharmacyModelView)
        .tabItem {
          Image(systemName: "house")
        }
    }
    .accentColor(.black)
  }
}

#Preview {
  ContentView()
}


