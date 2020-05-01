//
//  AppStoryboards.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//  Based off the code found here: https://medium.com/@gurdeep060289/clean-code-for-multiple-storyboards-c64eb679dbf6

import Foundation
import UIKit

// This makes it easier to identify storyboards that need a network manager instance injected into them.
enum AppStoryboard : String {
    case Main
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>
        (viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func viewController<T : UIViewController & Networkable>
        (viewControllerClass : T.Type, provider: NetworkManager, function : String = #function, line : Int = #line, file : String = #file) -> T {
        var scene = self.viewController(viewControllerClass: viewControllerClass)
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

extension Networkable where Self: UIViewController {
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard, provider: NetworkManager) -> Self {
        return appStoryboard.viewController(viewControllerClass: self, provider: provider)
    }
}
