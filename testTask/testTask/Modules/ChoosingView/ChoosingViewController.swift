//
//  ChoosingViewController.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

final class ChoosingViewController: BaseViewController, ChoosingViewProtocol, UIScrollViewDelegate {
    
    let screenSize = UIScreen.main.bounds
    private var pagesViewModel = [PageViewModel]()
    private var viewModel: ChoosingViewModel?
    var presenter: ChoosingPresenterProtocol!
    
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad?()
    }
    
    private func updateScrollView() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        let height = scrollView.frame.height
        scrollView.contentSize = CGSize(width: screenSize.width * CGFloat(pagesViewModel.count), height: height)
        
        for (index, viewModel) in pagesViewModel.enumerated() {
            let pageView = PageView.initFromXib()
            
            pageView.frame = CGRect(x: screenSize.width * CGFloat(index), y: 0,
                                    width: screenSize.width, height: height)
            
            pageView.updateViewInterface(viewModel)
            scrollView.addSubview(pageView)
        }
    }
    
    private func updateScrollViewPosition(currentPage: Int) {
        let point = CGPoint(x: screenSize.width * CGFloat(currentPage), y: CGFloat(0))
        scrollView.setContentOffset(point, animated: true)
    }
    
    private func updatePageControl() {
        pageControl.currentPage = viewModel?.currentPage ?? 0
        navigationButton.setTitle(viewModel?.buttonLabel, for: .normal)
    }
    
    func updateViewInterface(_ viewModel: Any) {
        if let viewModel = viewModel as? [PageViewModel] {
            pagesViewModel = viewModel
            updateScrollView()
        } else if let viewModel = viewModel as? ChoosingViewModel {
            self.viewModel = viewModel
            updatePageControl()
        } else if let currentPage = viewModel as? Int {
            updateScrollViewPosition(currentPage: currentPage)
        } else {
            fatalError("invalid model")
        }
    }
    
    func presentTimerView() {
        let timerView = TimerView.initFromXib()
        timerView.delegate = presenter
        view.addSubview(timerView)
        
        timerView.translatesAutoresizingMaskIntoConstraints = true
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timerView.topAnchor.constraint(equalTo: view.topAnchor),
            timerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @IBAction func didTapNavigationButton(_ sender: UIButton) {
        presenter.didTapNavigationButton()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.didScrollPage(currentPage: Int(scrollView.contentOffset.x / screenSize.width))
    }
}
