//
//  FilterView.swift
//  pharmacy
//
//  Created by admin on 2024/03/09.
//

import SwiftUI

struct FilterView: View {
  @EnvironmentObject var vm: WeekendPharmacyList

  var body: some View {
    HStack() {
      Button {
//        if vm.StateWithProvince == "경기도" {
//          vm.fetchChangeStateWithProvince(StateWithProvince: "서울특별시")
//        }else {
//          vm.fetchChangeStateWithProvince(StateWithProvince: "경기도")
//        }
      } label: {
        //      Text(vm.StateWithProvince)
        Text("서울특별시")
          .foregroundColor(Color.primary)
          .font(.footnote)
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 8)
      .background(Color.white)
      .cornerRadius(10)

      Button {
//        if vm.StateWithProvince == "경기도" {
//          vm.fetchChangeStateWithProvince(StateWithProvince: "서울특별시")
//        }else {
//          vm.fetchChangeStateWithProvince(StateWithProvince: "경기도")
//        }
      } label: {
        //      Text(vm.StateWithProvince)
        Text("강남구")
          .foregroundColor(Color.primary)
          .font(.footnote)
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 8)
      .background(Color.white)
      .cornerRadius(10)

      Spacer()
    } //HStack
    .padding(.vertical, 10)
  }
}

#Preview {
  FilterView()
}
