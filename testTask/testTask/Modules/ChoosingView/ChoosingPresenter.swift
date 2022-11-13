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
    private var currentPage = 0
    
    init(viewController: ChoosingViewProtocol, coordinator: Coordinator) {
        self.viewController = viewController
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        setupPages()
        changePage(needNewOffset: false)
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
            changePage(needNewOffset: true)
        } else {
            print("TODO")
        }
    }
    
    func didScrollPage(currentPage: Int) {
        self.currentPage = currentPage
        changePage(needNewOffset: false)
    }
    
    func changePage(needNewOffset: Bool) {
        var buttonLabel: String
        if currentPage < PageViewModel.maximumIndex {
            buttonLabel = "next"
        } else {
            buttonLabel = "Continue"
        }
        
        DispatchQueue.main.async { [viewController, currentPage] in
            viewController?.updateViewInterface(ChoosingViewModel(currentPage: currentPage,
                                                                  buttonLabel: buttonLabel,
                                                                  needNewOffset: needNewOffset))
        }
    }
}
