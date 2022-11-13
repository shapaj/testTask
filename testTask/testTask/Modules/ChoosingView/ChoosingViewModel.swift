//
//  ChoosingViewModel.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

struct ChoosingViewModel {
    var curentPage = 0
    var buttonLabel = "next"
    var needNewOffset: Bool
    
    init(currentPage: Int, buttonLabel: String, needNewOffset: Bool ) {
        self.curentPage = currentPage
        self.buttonLabel = buttonLabel
        self.needNewOffset = needNewOffset
    }
}
