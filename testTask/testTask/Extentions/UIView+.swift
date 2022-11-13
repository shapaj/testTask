//
//  UIView+.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

protocol NibLoadable: UIView { }

extension NibLoadable {

    static func initFromXib() -> Self {
        let dynamicMetatype = Self.self
        let bundle = Bundle(for: dynamicMetatype)
        let nib = UINib(nibName: "\(dynamicMetatype)", bundle: bundle)
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not load view from nib file.")
        }
        
        return view
        
    }
}
