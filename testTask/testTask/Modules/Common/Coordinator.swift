//
//  Coordinator.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import UIKit

class Coordinator {
    
    private let window: UIWindow
    private var navigationController: UINavigationController
    private let dataManager = DataManager()
    
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)

        self.navigationController = UINavigationController()
        setupWindow()
    }
    
    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func startApplication() {
        navigationController.viewControllers = [StartViewAssembly.createModule(coordinator: self)]
    }
    
    func didTapStartButton() {
        
        let nextPage = UINavigationController(rootViewController: ChoosingAssembly.createModule(coordinator: self))
        
        nextPage.modalPresentationStyle = .fullScreen
        
        navigationController.present(nextPage, animated: true)
    }
    
    
}
