import Foundation
import XMLCoder


struct APIService {
  let urlString: String

  func getJSON<T: Decodable>( completion: @escaping (Result<T, APIError>) -> Void) {

    guard let url = URL(string: urlString) else {
      completion(.failure(.invalidURL))
      return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {

        completion(.failure(.invalidResponseStatus(error!.localizedDescription)))
        return
      }
      guard error == nil else {
        completion(.failure(.dataTaskError(error!.localizedDescription)))
        return
      }
      guard let data = data else {
        completion(.failure(.corruptData))
        return
      }

      do {
        let decodedData = try XMLDecoder().decode(T.self, from: data)
        print(decodedData)
        completion(.success(decodedData))
      } catch {
        print(error,"error")
        completion(.failure(.decodingError(error.localizedDescription)))
      }
    }
    .resume()
  }
}



enum APIError: Error, LocalizedError {
  case invalidURL
  case invalidResponseStatus(String)
  case dataTaskError(String)
  case corruptData
  case decodingError(String)

  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return NSLocalizedString("엔드포인트 이상함", comment: "")
    case .invalidResponseStatus(let string):
      return NSLocalizedString("호스트를 찾을수없음 - \(string)", comment: "")
    case .dataTaskError(let string):
      return string
    case .corruptData:
      return NSLocalizedString("데이터를 가져오는데 실패함", comment: "")
    case .decodingError(let string):
      return string
    }
  }
}



