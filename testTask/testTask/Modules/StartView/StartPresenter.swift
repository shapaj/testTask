//
//  StartPresenter.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import Foundation

class StartPresenter: StartPresenterProtocol {
    
    weak var viewController: StartViewProtocol?
    weak var coordinator: Coordinator?
    weak var datamanager: DataManager?
    
    init (viewController: StartViewProtocol, coordinator: Coordinator, dataManager: DataManager) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.datamanager = dataManager
    }
    
    func viewDidLoad() {
        updateCountsOfWatching()
    }
    
    func didTapStartButton() {
        coordinator?.didTapStartButton()
    }
    
    private func updateCountsOfWatching() {
    
        let queue = DispatchQueue.global(qos: .background)
        
        queue.async { [datamanager, viewController] in
            datamanager?.getCurrentInfo(index: 1) { item in
                DispatchQueue.main.async {
                    viewController?.updateViewInterface(item)
                }
            }
        }
        
        queue.async { [datamanager, viewController] in
            datamanager?.getCurrentInfo(index: 2) { item in
                DispatchQueue.main.async {
                    viewController?.updateViewInterface(item)
                }
            }
        }
        queue.async { [datamanager, viewController] in
            datamanager?.getCurrentInfo(index: 3) { item in
                DispatchQueue.main.async {
                    viewController?.updateViewInterface(item)
                }
            }
        }
    }
}
