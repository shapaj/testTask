//
//  ChoosingPresenterProtocol.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import Foundation

protocol  ChoosingPresenterProtocol: ViewLifeCycleProtocol {
    func didTapNavigationButton()
    func didScrollPage(currentPage: Int)
}
