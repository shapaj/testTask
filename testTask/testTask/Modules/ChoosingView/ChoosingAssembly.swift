//
//  ChoosingAssembly.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

struct ChoosingAssembly {
    
    static func createModule(coordinator: Coordinator) -> UIViewController {

        let viewController = ChoosingViewController.createVC()
        viewController.presenter = ChoosingPresenter(viewController:viewController, coordinator: coordinator)
        
        return viewController
    }
}
