//
//  PopularDestinationHeader.swift
//  TravelApp
//
//  Created by Will Wang on 6/16/21.
//

import UIKit
import SwiftUI
import Kingfisher


struct PopularDestinationHeader: UIViewControllerRepresentable {
    
    let photos: [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = DestinationPhotoPageVC(photos: photos)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}

class DestinationPhotoPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var allVC: [UIViewController] = photos.map {
        let vc = UIHostingController(rootView: KFImage(URL(string: $0)).resizable().scaledToFill())
        vc.view.clipsToBounds = true
        return vc
    }
    
    var photos: [String]
    
    init(photos: [String]) {
        self.photos = photos
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray5
//        setViewControllers([allVC.first!], direction: .forward, animated: true)
        if let firstVC = allVC.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
        dataSource = self
        delegate = self
    }
    
    // MARK: - Delegate
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
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

struct PopularDestinationHeader_Previews: PreviewProvider {
    
    static var previews: some View {
//        PopularDestinationHeader().frame(width: 375, height: 250)
        PopularDestinationDetailView(name: "paris")
    }
}
