//
//  WeekendPharmacyList.swift
//  pharmacy
//
//  Created by admin on 2024/03/09.
//

import Foundation
import XMLCoder
import Combine

class WeekendPharmacyModelView: ObservableObject {
  @Published var pharmacyItems: [Item] = []
  @Published var isLoading = false
  @Published var showAlert = false
  @Published var errorMessage: String?
  @Published var pageNo = 1
  @Published var StateWithProvince = "서울특별시"
  @Published var district = "강남구"

  private var cancellables = Set<AnyCancellable>()

  init() {
    fetchPharmacy()
  }

  func fetchPharmacy() {
    isLoading = true
    let baseUrl = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService"
    let serviceKey = "ir200GbyYA1xhjOc8IJOQvJOGJBpoYiHVM%2FBnewUd8NZPPvpVAzevlsPq74OCEzsDTzgvvP4e%2B6LMQWPrRac5g%3D%3D"
    let endPoint = "getParmacyListInfoInqire"
    let numOfRows = "20"

    let encodedStateWithProvince = StateWithProvince.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let encodedDistrict = district.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

    let urlString = "\(baseUrl)/\(endPoint)?serviceKey=\(serviceKey)&numOfRows=\(numOfRows)&Q0=\(encodedStateWithProvince)&Q1=\(encodedDistrict)&pageNo=\(pageNo)&QT=7"

    guard let url = URL(string: urlString) else {
      print("Invalid URL:", urlString)
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .decode(type: PharmacyModel.self, decoder: XMLDecoder())
          .receive(on: DispatchQueue.main)
          .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
              print("success")
            case .failure(let error):
              print("failure", error)
            }
            self.isLoading = false
          }, receiveValue: { [weak self] decodedData in
            guard let self = self else { return }
            self.pharmacyItems.append(contentsOf: decodedData.body.items.item)
          })
          .store(in: &cancellables)
  }
}

extension WeekendPharmacyModelView {
  func fetchPharmacyIfNeeded(for index: Int) {
    print("새로 패칭")
      pageNo += 1
      fetchPharmacy()
   }
  func fetchChangeStateWithProvince(StateWithProvince: String, district: String) {
      self.StateWithProvince = StateWithProvince
      self.district = district
      pharmacyItems = []
      pageNo = 1
      fetchPharmacy()
   }
  func fetchChangeDistrict(district: String) {
      self.StateWithProvince = StateWithProvince
      self.district = district
      pharmacyItems = []
      pageNo = 1
      fetchPharmacy()
   }
}

