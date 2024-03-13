//
//  DropDown.swift
//  pharmacy
//
//  Created by admin on 2024/03/10.
//

import SwiftUI

struct DropDown: View {
  var content: [String]
  @Binding var selection: String
  var activeTint: Color
  var inActivetint: Color
  @State private var expandView: Bool = false

    var body: some View {
      GeometryReader {_ in
        let size = 0$.size
        VStack() {
          
        }
      }
    }
}

#Preview {
    DropDown()
}
