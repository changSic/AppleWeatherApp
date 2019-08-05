//
//  LocationWeatherCollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class LocationWeatherCollectionView: UICollectionView {
  
  // MARK: Networking
  private let weatherService: WeatherServiceType = WeatherService()
  var currently: Currently?
  
  // MARK: - Initializers
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - Configure
  private func configure() {
    register(LocationWeatherHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LocationWeatherHeaderView.identifier)
    register(cell: FirstCollectionCell.self)
    register(cell: SecondCollectionCell.self)
    register(cell: ThirdCollectionCell.self)
    dataSource = self
    delegate = self
    // configure
    backgroundColor = .clear
    showsVerticalScrollIndicator = false
  }
  
}

// MARK: - CollectionView DataSource
extension LocationWeatherCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell = UICollectionViewCell()
    switch indexPath.item {
    case 0:
      cell = collectionView.dequeue(FirstCollectionCell.self, indexPath)
    case 1:
      cell = collectionView.dequeue(SecondCollectionCell.self, indexPath)
    case 2:
      cell = collectionView.dequeue(ThirdCollectionCell.self, indexPath)
    default:
      break
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LocationWeatherHeaderView.identifier, for: indexPath) as! LocationWeatherHeaderView
    
    return header
  }
}

// MARK: - Collection FlowLayout and Delegate
extension LocationWeatherCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.item {
    case 0:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.45)
    case 1:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.1)
    case 2:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.40)
    default:
      break
    }
    
    return CGSize(width: ScreenBounds.width, height: 100)
  }
  
  // ScrollView Delegate
  // FIXME: - 상단 애니메이션 고민해보자
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // 아랫쪽으로 보려고 위로 슬라이드 해서 스크롤 내리면 y + 로 커짐
    print("Content Offset : \(scrollView.contentOffset)")
    
  }
 
 
}