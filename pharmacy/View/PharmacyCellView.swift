//
//  PharmacyCellView.swift
//  pharmacy
//
//  Created by admin on 2024/03/09.
//

import SwiftUI

struct MockData {
    static let mockItem = Item(
        dutyAddr: "서울특별시 송파구 올림픽로 354 606 서울특별시 송파구 올림픽로 354 606 서울특별시 송파구 올림픽로 354 606 서울특별시 송파구 올림픽로 354 606",
        dutyName: "대박 약국",
        dutyTel1: "010-1234-5678",
        
        dutyTime1c: "예시 영업 종료 시간",
        dutyTime2c: "예시 영업 종료 시간2",
        dutyTime3c: "예시 영업 종료 시간3",
        dutyTime4c: "예시 영업 종료 시간4",
        dutyTime5c: "예시 영업 종료 시간5",
        dutyTime6c: "0900",
        dutyTime7c: "1000",
//        dutyTime8c: "예시 영업 종료 시간8",

        dutyTime1s: "예시 영업 시작 시간",
        dutyTime2s: "예시 영업 시작 시간2",
        dutyTime3s: "예시 영업 시작 시간3",
        dutyTime4s: "예시 영업 시작 시간4",
        dutyTime5s: "예시 영업 시작 시간5",
        dutyTime6s: "2000",
        dutyTime7s: "1300",
//        dutyTime8s: "예시 영업 시작 시간8",

        hpid: "123456789",
        postCdn1: 12345,
        postCdn2: "ABCDE",
        rnum: 1,
        wgs84Lat: 37.123456,
        wgs84Lon: 127.123456
    )
}

struct PharmacyCellView: View {
  let pharmacy: Item
    var body: some View {
      LazyVStack(alignment: .leading) {
        HStack {
          Text(pharmacy.dutyName)
            .font(.title3)
            .fontWeight(.medium)
          Spacer()
        }.padding(.bottom, 3)

        HStack(alignment: .top) {
          Text(pharmacy.dutyTel1)
            .font(.footnote)
            .fontWeight(.medium)

          Spacer()

          VStack(alignment: .leading) {
            Text(pharmacy.saturdayTime)
              .font(.caption)
            Text(pharmacy.sunDayTime)
              .font(.caption)
          }
        }.padding(.bottom, 3)

        Text(pharmacy.dutyAddr)
          .lineLimit(2)
          .font(.subheadline)
      }
      .padding(.all)
      .background(.background, in: .rect(cornerRadius: 10))
      .frame(minHeight: 100)
    }
}

#Preview {
  PharmacyCellView(pharmacy: MockData.mockItem)
}


