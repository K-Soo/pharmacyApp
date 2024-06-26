//
//  KakaoMapView.swift
//  pharmacy
//
//  Created by admin on 2024/03/16.
//

import SwiftUI
import Foundation
import KakaoMapsSDK

struct KakaoMapView: UIViewRepresentable {
  @Binding var draw: Bool
  var long: Double
  var lat: Double

  /// UIView를 상속한 KMViewContainer를 생성한다.
  /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
  func makeUIView(context: Self.Context) -> KMViewContainer {
    let view: KMViewContainer = KMViewContainer()
    view.sizeToFit()
    context.coordinator.createController(view)
    context.coordinator.controller?.initEngine()

    return view
  }

  

  /// Updates the presented `UIView` (and coordinator) to the latest
  /// configuration.
  /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
  /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
  func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
    if draw {
      context.coordinator.controller?.startEngine()
      context.coordinator.controller?.startRendering()
    }
    else {
      context.coordinator.controller?.stopRendering()
      context.coordinator.controller?.stopEngine()
    }
  }

  /// Coordinator 생성
  func makeCoordinator() -> KakaoMapCoordinator {
    return KakaoMapCoordinator(long: long, lat: lat)
  }

  /// Cleans up the presented `UIView` (and coordinator) in
  /// anticipation of their removal.
  static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {

  }

  /// Coordinator 구현. KMControllerDelegate를 adopt한다.
  class KakaoMapCoordinator: NSObject, MapControllerDelegate {
    let long: Double
    let lat: Double

    init(long: Double, lat: Double) {
      first = true
       self.long = long
       self.lat = lat
//      super.init()
    }

    // KMController 객체 생성 및 event delegate 지정
    func createController(_ view: KMViewContainer) {
      controller = KMController(viewContainer: view)
      controller?.delegate = self
    }

    

    // KMControllerDelegate Protocol method구현

    /// 엔진 생성 및 초기화 이후, 렌더링 준비가 완료되면 아래 addViews를 호출한다.
    /// 원하는 뷰를 생성한다.
    func addViews() {
      let defaultPosition: MapPoint = MapPoint(longitude: long, latitude: lat)
      let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition, defaultLevel: 9)

      controller?.addView(mapviewInfo)
    }

    //addView 성공 이벤트 delegate. 추가적으로 수행할 작업을 진행한다.
    func addViewSucceeded(_ viewName: String, viewInfoName: String) {
      print("OK") //추가 성공. 성공시 추가적으로 수행할 작업을 진행한다.
    }

    //addView 실패 이벤트 delegate. 실패에 대한 오류 처리를 진행한다.
    func addViewFailed(_ viewName: String, viewInfoName: String) {
      print("Failed")
    }

    /// KMViewContainer 리사이징 될 때 호출.
    func containerDidResized(_ size: CGSize) {
      let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap

      if (mapView != nil) {
        mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
//        if first {
//          let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: 127.101187, latitude: 37.507078), zoomLevel: 10, mapView: mapView!)
//          mapView?.moveCamera(cameraUpdate)
//          first = false
//        }
      }
    }

    var controller: KMController?
    var first: Bool
  }
}

#Preview {
  KakaoMapView(draw: .constant(true), long: 127.101187, lat: 37.507078)
}
