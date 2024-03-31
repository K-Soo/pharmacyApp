//
//  GreenView.swift
//  pharmacy
//
//  Created by admin on 2024/03/30.
//

import SwiftUI

struct GreenView: View {
  var body: some View {
    TabView {
      NavigationStack {
        ScrollView {
          ForEach(0..<50, id: \.self) { index in
            NavigationLink(value: index) {
              HStack {
                Spacer()
                Text("\(index)")
                Spacer()
              }
            }
          }
        }
        .navigationTitle("주말약국")
        .navigationDestination(for: Int.self, destination: { data in
          VStack {
            Text("상세페이지")
          }
          .frame(height: .infinity)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .ignoresSafeArea(.all)
          .background(.red)
          .edgesIgnoringSafeArea(.all) // 예시로 안전 영역 무시
        })
        .navigationBarTitleDisplayMode(.inline)
      } //NavigationStack
      .tabItem {
        Label(
          title: { Text("Label") },
          icon: { Image(systemName: "42.circle") }
        )
      }
    } //TabView

  }
}

#Preview {
    GreenView()
}
