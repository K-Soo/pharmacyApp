//
//  Pharmacy.swift
//  pharmacy
//
//  Created by admin on 2024/03/11.
//

import SwiftUI

struct WeekendPharmacyView: View {
  @State private var isShow = false
  @State private var selectedPharmacy: Item?

  @EnvironmentObject var vm: WeekendPharmacyModelView

  var body: some View {
    NavigationStack {

      HStack(alignment: .top) {
        AddressPickerView()
  
        Spacer()
      }
      VStack {
        if vm.pharmacyItems.isEmpty && !vm.isLoading {
          VStack {
            EmptyView()
            Spacer()
          }
          .frame(maxWidth: .infinity,maxHeight: .infinity)  
        } else {
          ScrollView(showsIndicators: false) {
            ForEach(0..<vm.pharmacyItems.count, id: \.self) { index in
              LazyVStack {
                PharmacyCellView(pharmacy: vm.pharmacyItems[index])
                  .onAppear {
                    if index >= vm.pharmacyItems.count - 1 {
                      vm.fetchPharmacyIfNeeded(for: index)
                    }
                  }
                  .onTapGesture {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                    selectedPharmacy = vm.pharmacyItems[index]
                  }
              }
            } //ForEach
            .padding(10)
          } //ScrollView
          .frame(maxWidth: .infinity,maxHeight: .infinity)
          .background(.gray.opacity(0.08))
        }
      } //VStack
      .navigationTitle("주말약국")
      .navigationBarTitleDisplayMode(.inline)
      .overlay(content: {
        if vm.isLoading && vm.pharmacyItems.isEmpty {
          ProgressView()
        }
      })
    } //NavigationStack
  }
}

#Preview {
  WeekendPharmacyView()
    .environmentObject(WeekendPharmacyModelView())
}
