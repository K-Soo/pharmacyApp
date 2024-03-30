//
//  Pharmacy.swift
//  pharmacy
//
//  Created by admin on 2024/03/11.
//

import SwiftUI

struct WeekendPharmacyView: View {
  @EnvironmentObject var vm: WeekendPharmacyModelView
  @State private var isShow = false
  @State var draw: Bool = false
  @State private var selectedPharmacy: Item? {
    didSet {
      if let current = selectedPharmacy {
        print(current,"@@")
      }
    }
  }


  var body: some View {
    NavigationStack {
      HStack {
        HStack(alignment: .top) {
          AddressPickerView()
          Spacer()
        }
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
                NavigationLink(value: vm.pharmacyItems[index]) {
                  PharmacyCellView(pharmacy: vm.pharmacyItems[index])
                    .onAppear {
                      if index >= vm.pharmacyItems.count - 1 {
                        vm.fetchPharmacyIfNeeded(for: index)
                      }
                    }
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
      .navigationDestination(for: Item.self, destination: { data in
        ZStack {
          KakaoMapView(draw: $draw, long: data.wgs84Lon, lat: data.wgs84Lat)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
              self.draw = true
            })
            .onDisappear {
              self.draw = false
            }
        }
      })
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
