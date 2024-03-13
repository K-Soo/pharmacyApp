import Foundation

struct Header: Codable {
  let resultCode: String
  let resultMsg: String
}

struct Item: Codable, Identifiable, Equatable {
  var id: Double { wgs84Lat }
  let dutyAddr: String
  let dutyName: String
  let dutyTel1: String

  let dutyTime1c: String?
  let dutyTime2c: String?
  let dutyTime3c: String?
  let dutyTime4c: String?
  let dutyTime5c: String?
  let dutyTime6c: String?
  let dutyTime7c: String?
//  let dutyTime8c: String

  let dutyTime1s: String?
  let dutyTime2s: String?
  let dutyTime3s: String?
  let dutyTime4s: String?
  let dutyTime5s: String?
  let dutyTime6s: String?
  let dutyTime7s: String?
//  let dutyTime8s: String

  var saturdayTime: String {
      if let startTime = dutyTime6s, let endTime = dutyTime6c {
        return "토요일 : \(startTime) ~ \(endTime)"
      }
      return "토요일 : 휴무"
  }
  var sunDayTime: String {
      if let startTime = dutyTime7s, let endTime = dutyTime7c {
        return "일요일 : \(startTime) ~ \(endTime)"
      }
      return "일요일 : 휴무"
  }

  let hpid: String
  let postCdn1: Int
  let postCdn2: String
  let rnum: Int

  let wgs84Lat: Double
  let wgs84Lon: Double

  static func == (lhs: Item, rhs: Item) -> Bool {
       return lhs.id == rhs.id
   }
}

struct Body: Codable {
  struct Items: Codable {
    let item: [Item]
  }

  let items: Items
  let numOfRows: Int
  let pageNo: Int
  let totalCount: Int
}

struct PharmacyModel: Codable {
//  let header: Header
  let body: Body
}


