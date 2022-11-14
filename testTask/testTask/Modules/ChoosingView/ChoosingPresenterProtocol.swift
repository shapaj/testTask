//
//  ChoosingPresenterProtocol.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import Foundation

protocol  ChoosingPresenterProtocol: ViewLifeCycleProtocol, TimerViewDelegate {
    func didTapNavigationButton()
    func didScrollPage(currentPage: Int)
}
