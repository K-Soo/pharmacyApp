//
//  AddressPickerView.swift
//  pharmacy
//
//  Created by admin on 2024/03/10.
//

import SwiftUI

struct AddressPickerView: View {
  let cities = CityModel.cities
  let districts = DistrictsModel.districts

  @State private var selectedCity: String = "서울특별시"

  @State private var selectedDistrict: String = "강남구"

  @EnvironmentObject var vm: WeekendPharmacyModelView

  var body: some View {
    HStack {

      Picker("시도", selection: $selectedCity) {
        ForEach(cities, id: \.self) { city in
          Text(city)
        }
      }
      .pickerStyle(MenuPickerStyle())
      .onTapGesture {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
      }

      if let cityDistricts = districts[selectedCity] {

        Picker("군구", selection: $selectedDistrict) {
          ForEach(cityDistricts, id: \.self) { district in
            Text(district)
              .tag(district)
          }
        }
        .pickerStyle(MenuPickerStyle())
        .onTapGesture {
          let generator = UIImpactFeedbackGenerator(style: .soft)
          generator.impactOccurred()
        }
      }
    }
    .accentColor(.black)
    .onChange(of: selectedCity) { newValue in
      if let targetCity = districts[newValue], let targetDistrict = targetCity.first {
        vm.fetchChangeStateWithProvince(StateWithProvince: newValue, district: targetDistrict)
      }
    }
    .onChange(of: selectedDistrict) { newValue in
//      #if DEVELOPMENT
      vm.fetchChangeDistrict(district: newValue)
//      #endif
    }
  }
}

#Preview {
  AddressPickerView()
}
