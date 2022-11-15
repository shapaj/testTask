//
//  ViewLifeCycle.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import Foundation

@objc protocol ViewLifeCycleProtocol {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
    @objc optional func viewDidDisappear()
}
