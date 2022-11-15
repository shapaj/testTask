//
//  ChoosingPresenter.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

class ChoosingPresenter: ChoosingPresenterProtocol {
    
    weak var viewController: ChoosingViewProtocol?
    weak var coordinator: Coordinator?
    unowned var userDefaultsManager: UserDefaultsManager
    weak var dataManager: DataManager?
    
    private var currentPage = 0 {
        didSet {
            if currentPage != oldValue {
                saveWatchingData(currentPage: currentPage)
            }
        }
    }
    
    init(viewController: ChoosingViewProtocol, coordinator: Coordinator, userDefaultsManager: UserDefaultsManager, dataManager: DataManager) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.dataManager = dataManager
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        setupPages()
        changePage()
    }
    private func setupPages() {
        let pagesViewModel = PageViewModel.pagesViewModel()
        DispatchQueue.main.async { [viewController] in
            viewController?.updateViewInterface(pagesViewModel)
        }
        saveWatchingData(currentPage: 0)
    }
    
    private func presentTimerView() {
        viewController?.presentTimerView()
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "Thank you for your interest"
        alert.message = "The functionality is under development"
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        viewController?.present(alert, animated: true)
    }
    
    private func saveWatchingData(currentPage: Int) {
        let queue = DispatchQueue.global(qos: .background)
        queue.async { [dataManager, currentPage] in
            dataManager?.newWatching(index: currentPage + 1, time: Date())
        }
    }
    
    private func changePage() {
        var buttonLabel = currentPage < PageViewModel.maximumIndex ? "Next" : "Continue"
        
        DispatchQueue.main.async { [viewController, currentPage] in
            viewController?.updateViewInterface(ChoosingViewModel(currentPage: currentPage, buttonLabel: buttonLabel))
        }
    }
    
    func didTapNavigationButton() {
        if currentPage < PageViewModel.maximumIndex {
            currentPage += 1
            DispatchQueue.main.async { [viewController, currentPage] in
                viewController?.updateViewInterface(currentPage)
            }
        } else {
            if userDefaultsManager.getTimerCompleted() {
                presentAlert()
            } else {
                presentTimerView()
            }
        }
    }
    
    func didScrollPage(currentPage: Int) {
        self.currentPage = currentPage
        changePage()
    }
    
    func willRemoveFromSuperView() {
        userDefaultsManager.saveTimerCompleted(completed: true)
    }
}
