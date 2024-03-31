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

  var body: some View {

//    TabView {
      GreenView()
//        .tabItem {
//          Image(systemName: "house")
//          Text("홈")
//        }
//      BlueView()
//        .tabItem {
//          Image(systemName: "house")
//          Text("홈")
//        }
//    }
    .accentColor(.black)
  }
}

#Preview {
  ContentView()
}


