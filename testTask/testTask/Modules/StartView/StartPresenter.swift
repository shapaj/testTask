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

    init (viewController: StartViewProtocol, coordinator: Coordinator) {
        self.viewController = viewController
        self.coordinator = coordinator
    }

    func didTapStartButton() {
        coordinator?.didTapStartButton()
    }
}
