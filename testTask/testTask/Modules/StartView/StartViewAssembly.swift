//
//  StartViewAssembly.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import UIKit

struct StartViewAssembly {
    static func createModule(coordinator: Coordinator) -> UIViewController {
        
        let viewController = StartViewController.createVC()
        
        viewController.presenter = StartPresenter(viewController: viewController, coordinator: coordinator)
        
        return viewController
    }
}
