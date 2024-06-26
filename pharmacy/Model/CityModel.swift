//
//  City.swift
//  pharmacy
//
//  Created by admin on 2024/03/10.
//

import Foundation

//static 키워드는 해당 속성 또는 메서드가 해당 타입에 속하고 인스턴스가 아니라 타입 자체에 속한다는 것을 나타냅니다.
//이 경우, cities 배열은 CityModel 타입에 속하므로 인스턴스를 생성하지 않고도 직접 접근할 수 있습니다.
struct CityModel {
  static let cities = [
      "서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시",
      "대전광역시", "울산광역시", "세종특별자치시", "경기도", "강원도",
      "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도"
  ]
}
