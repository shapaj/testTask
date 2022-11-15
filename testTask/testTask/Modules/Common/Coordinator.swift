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
    private let userDefaultsManager = UserDefaultsManager()
    
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
        navigationController.viewControllers = [StartViewAssembly.createModule(coordinator: self, dataManager: dataManager)]
    }
    
    func didTapStartButton() {
        let nextPage = UINavigationController(rootViewController: ChoosingAssembly.createModule(coordinator: self,
                                                                                                userDefaultsManager: userDefaultsManager,
                                                                                                dataManager: dataManager))
        
        nextPage.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async { [weak navigationController] in
            navigationController?.present(nextPage, animated: true)
        }
    }
}
