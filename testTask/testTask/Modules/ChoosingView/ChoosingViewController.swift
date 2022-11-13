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
    
    private func updateScrollViewPosition(curentPage: Int) {
        let point = CGPoint(x: screenSize.width * CGFloat(curentPage), y: CGFloat(0))
        scrollView.setContentOffset(point, animated: true)
    }
    
    private func updatePageControl() {
        pageControl.currentPage = viewModel?.curentPage ?? 0
        navigationButton.setTitle(viewModel?.buttonLabel, for: .normal)
    }
    
    func updateViewInterface(_ viewModel: Any) {
        if let viewModel = viewModel as? [PageViewModel] {
            pagesViewModel = viewModel
            updateScrollView()
        } else if let viewModel = viewModel as? ChoosingViewModel {
            self.viewModel = viewModel
            updatePageControl()
        } else if let curentPage = viewModel as? Int {
            updateScrollViewPosition(curentPage: curentPage)
        } else {
            fatalError("invalid model")
        }
    }
    
    @IBAction func didTapNavigationButton(_ sender: UIButton) {
        presenter.didTapNavigationButton()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.didScrollPage(currentPage: Int(scrollView.contentOffset.x / screenSize.width))
    }
}
