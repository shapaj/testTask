//
//  UIViewController+.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import UIKit

extension UIViewController {
    static func createVC() -> Self {
        let storyBord = UIStoryboard(name: String(describing: self), bundle: Bundle.main)
        
        guard let viewController = storyBord.instantiateInitialViewController() as? Self else {
            fatalError("didn't find \(Self.self) view controlled")
        }
        
        return viewController
    }
}
