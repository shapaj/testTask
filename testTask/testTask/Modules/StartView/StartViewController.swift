//
//  StartViewController.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import UIKit

final class StartViewController: BaseViewController, StartViewProtocol {
    
    @IBOutlet private weak var startButton: UIButton!
    var presenter: StartPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        startButton.layer.cornerRadius = DefaultValues.ViewSizes.cornerRadius
    }
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        presenter.didTapStartButton()
    }
    
}
