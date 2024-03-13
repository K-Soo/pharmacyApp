//
//  DropDownView.swift
//  pharmacy
//
//  Created by admin on 2024/03/10.
//

import SwiftUI

enum List {
  case 서울특별시
  case 경기도
}

struct DropDownView: View {
  @EnvironmentObject var weekendPharmacyListViewModel: WeekendPharmacyList
  @Environment(\.colorScheme) var scheme
  @State private var isExpended = false

  let cities = ["서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시"]
    let districts = [
        "서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
        "부산광역시": ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군"],
        // 다른 시도의 군구 목록도 여기에 추가할 수 있습니다.
    ]


  let title: String
  let prompt: String
  let options: [String]


  @Binding var selection: String?


  var body: some View {

      VStack {
        HStack {
//          Text(weekendPharmacyListViewModel.StateWithProvince)
          Text("ㄴㅇ")

          Spacer()

          Image(systemName: "chevron.down")
            .font(.subheadline)
            .foregroundColor(.gray)
            .rotationEffect(Angle.degrees(isExpended ? 180 : 0))
        }
        .frame(height: 40)
        .padding(.horizontal)
        .onTapGesture {
          withAnimation(.snappy) {
            isExpended.toggle()
          }
        }

        if isExpended {
          VStack {
            ForEach(options, id: \.self) { option in
              HStack{
                Text(option)
                  .foregroundStyle(selection == option ? Color.primary : .gray)

                Spacer()

                if selection == option {
                  Image(systemName: "checkmark")
                    .font(.subheadline)
                }
              }
              .frame(height: 40)
              .padding(.horizontal)
              .onTapGesture {
                withAnimation(.snappy) {
                  self.selection = option
                  isExpended.toggle()
                }
              }
            }
          }
          .transition(.move(edge: .bottom))
        }
      }
      .background(scheme == .dark ? .black : .white)
      .cornerRadius(10)
      .shadow(color: .primary.opacity(0.1), radius: 4)
      .frame(width: 150)
  }
}


#Preview {
  DropDownView(title: "서울특별시", prompt: "선택", options: ["경기도", "전라도","경상남도"], selection: .constant("전라도"))
}
