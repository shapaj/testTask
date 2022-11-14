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
    unowned var dataManager: DataManager
    
    private var currentPage = 0
    
    init(viewController: ChoosingViewProtocol, coordinator: Coordinator, dataManager: DataManager) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.dataManager = dataManager
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
    }
    
    func didTapNavigationButton() {
        if currentPage < PageViewModel.maximumIndex {
            currentPage += 1
            DispatchQueue.main.async { [viewController, currentPage] in
                viewController?.updateViewInterface(currentPage)
            }
        } else {
            if dataManager.getTimerCompleted() {
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
    
    func willRemoveFromSuperView() {
        dataManager.saveTimerCompleted(completed: true)
    }
    
    
    private func changePage() {
        var buttonLabel: String
        if currentPage < PageViewModel.maximumIndex {
            buttonLabel = "Next"
        } else {
            buttonLabel = "Continue"
        }
        
        DispatchQueue.main.async { [viewController, currentPage] in
            viewController?.updateViewInterface(ChoosingViewModel(currentPage: currentPage,
                                                                  buttonLabel: buttonLabel))
        }
    }
}
