//
//  StartViewController.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import UIKit

final class StartViewController: BaseViewController, StartViewProtocol {
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet weak var page1Count: UILabel!
    @IBOutlet weak var page2Count: UILabel!
    @IBOutlet weak var page3Count: UILabel!
  
    var presenter: StartPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad?()
        setupView()
    }
    
    private func setupView() {
        startButton.layer.cornerRadius = DefaultValues.ViewSizes.cornerRadius
    }
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        presenter.didTapStartButton()
    }
    
    func updateViewInterface(_ viewModel: Any) {
        if let viewModel = viewModel as? WatchedItem {
            updateLabels(viewModel: viewModel)
        } else {
            fatalError("error")
        }
    }
    
    private func updateLabels(viewModel: WatchedItem) {
        switch viewModel.title {
        case "page1": page1Count.text = String(viewModel.watchingCount)
        case "page2": page2Count.text = String(viewModel.watchingCount)
        case "page3": page3Count.text = String(viewModel.watchingCount)
        default :
            return
        }
    }
    
}
