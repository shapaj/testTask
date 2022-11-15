//
//  PageView.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

class PageView: UIView, NibLoadable, ViewUpdateble {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var generalText: UILabel!
    @IBOutlet private weak var additionalText: UILabel!
   
    func updateViewInterface(_ viewModel: Any) {
        if let viewModel = viewModel as? PageViewModel {
            imageView.image = viewModel.image
            generalText.text = viewModel.generalText
            additionalText.text = viewModel.additionalText
        } else {
            fatalError("invalid view model")
        }
    }

}

struct PageViewModel {
    let image: UIImage?
    let generalText: String
    let additionalText: String
    
    static func pagesViewModel() -> [PageViewModel] {
        return [PageViewModel(image: DefaultValues.Images.firstView, generalText: "First view", additionalText: "Lorem Ipsum"),
         PageViewModel(image: DefaultValues.Images.secondView, generalText: "Second view", additionalText: "Lorem Ipsum"),
         PageViewModel(image: DefaultValues.Images.thirtView, generalText: "Thirt view", additionalText: "Lorem Ipsum")
        ]
    }
    
    static let maximumIndex: Int = 2
}
