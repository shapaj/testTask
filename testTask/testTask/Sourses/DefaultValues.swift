//
//  DefaultValues.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

struct DefaultValues {
    struct Colors {
        static let backgroundColor = UIColor(named: "BackgroundColor")
        static let TintColor = UIColor(named: "TintColor")
        static let DisabledTintColor = UIColor(named: "DisabledTintColor")
    }
    struct ViewSizes {
        static let cornerRadius = CGFloat(5)
    }
    
    struct Images {
        static let firstView = UIImage(named: "firstView")!
        static let secondView = UIImage(named: "secondView")!
        static let thirtView = UIImage(named: "thirtView")!
    }
}
