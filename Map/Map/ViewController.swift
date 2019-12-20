//
//  ViewController.swift
//  Map
//
//  Created by 오지훈 on 20/12/2019.
//  Copyright © 2019 JiHoon Oh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self //델리게이트 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.startUpdatingLocation() //위치 업데이트 시작
        myMap.showsUserLocation = true //위치 보기 값 설정
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) //위도 값과 경도 값을 매개변수로 하여 함수 호출
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //범위 값을 매개변수로 하여 호출
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //각각을 매개변수로 하여 함수 호출
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String, subtitle strSubtitle : String) {
        let annotation = MKPointAnnotation() //핀을 설치하기 위해 함수 호출
        annotation.coordinate = goLocation(latitudeValue : latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //위치가 업데이트되면 마지막 위치 값 찾기
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01) //마지막 위치의 위도와 경도 값을 가지고 함수 호출 델타는 지도의 확대
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first //상수로 대입
            let country = pm!.country //나라값을 상수에 대입
            var address:String = country! //문자열에 상수값 대입
            if pm!.locality != nil { //상수에서 지역값이 존재하면 문자열 추가
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil { //도로값이 존재하면 문자열 추가
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation() //위치 업데이트 멈춤
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000003, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.5307871, longitudeValue: 126.8981, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        } else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitudeValue: 37.540329, longitudeValue: 127.055122, delta: 0.1, title: "비트큐브", subtitle: "서울시 성동구 성수이로 51")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "비트큐브"
        }
    }
    
}

