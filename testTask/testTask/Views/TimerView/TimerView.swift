//
//  TimerView.swift
//  testTask
//
//  Created by Ihor on 13.11.2022.
//

import UIKit

protocol TimerViewDelegate: AnyObject {
    func willRemoveFromSuperView()
}

class TimerView: UIView, ViewUpdateble, NibLoadable {
  
    @IBOutlet private weak var presentationLabel: UILabel!
    @IBOutlet private weak var continiueButton: UIButton!
    @IBOutlet private weak var durationProgress: UIProgressView!
    
    private var timer: Timer?
    private var totalDuration: Int = 60
    weak var delegate: TimerViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async { [weak self] in
            self?.updateViewInterface(TimerViewViewModel(self?.totalDuration ?? 0))
            self?.startTimer()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = DefaultValues.ViewSizes.timerViewCornerRadius
    }
    
    func updateViewInterface(_ viewModel: Any) {
        if let viewModel = viewModel as? TimerViewViewModel {
            presentationLabel.text = viewModel.presentation
            continiueButton.isEnabled = viewModel.isContiniueEnabled
            durationProgress.setProgress(viewModel.filling, animated: true)
            
        } else {
            fatalError("invalid model")
        }
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownOperation), userInfo: nil, repeats: true)
    }

    @objc func countDownOperation() {
        guard totalDuration > 0 else {
            timer?.invalidate()
            timer = nil
            return
        }
        totalDuration -= 1
        DispatchQueue.main.async { [weak self] in
            self?.updateViewInterface(TimerViewViewModel(self?.totalDuration ?? 0))
        }
        
    }
    
    @IBAction func didTapContiniue(_ sender: UIButton) {
        delegate?.willRemoveFromSuperView()
        self.removeFromSuperview()
    }
}

struct TimerViewViewModel {
    let duration: Int
    let filling: Float
    let presentation: String
    let isContiniueEnabled: Bool
    
    init (_ duration: Int) {
        self.duration = duration
        filling = Float(duration) / Float(60)
        presentation = String(format: "%02d", Int(duration / 60)) + ":" + String(format: "%02d", Int(duration % 60))
        isContiniueEnabled = duration <= 0
    }
}
