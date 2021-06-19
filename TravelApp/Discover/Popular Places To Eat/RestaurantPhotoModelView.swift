//
//  RestaurantPhotoModelView.swift
//  TravelApp
//
//  Created by Will Wang on 6/19/21.
//

import UIKit
import SwiftUI
import Kingfisher


struct RestaurantPhotoModelView: UIViewControllerRepresentable {
    
    let photos: [String]
    @Binding var index: Int
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = RestaurantPhotoPageVC(photos: photos, selectedIndex: index)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}

class RestaurantPhotoPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var allVC: [UIViewController] = photos.map { url in
        let vc = UIHostingController(rootView:
                                        ZStack {
                                            Color.black
                                            KFImage(URL(string: url))
                                            .resizable()
                                            .scaledToFit()
                                        })
        vc.view.clipsToBounds = true
        return vc
    }
    
    var photos: [String]
    var selectedIndex: Int
    
    init(photos: [String], selectedIndex: Int) {
        self.photos = photos
        self.selectedIndex = selectedIndex
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray5
        
        if selectedIndex < allVC.count  {
            setViewControllers([allVC[selectedIndex]], direction: .forward, animated: true)
        }
        dataSource = self
        delegate = self
    }
    
    // MARK: - Delegate
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        selectedIndex
    }
    
    
    // MARK: - Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = allVC.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        
        return allVC[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = allVC.firstIndex(of: viewController) else { return nil }
        if index == allVC.count - 1 { return nil }
        
        return allVC[index+1]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
