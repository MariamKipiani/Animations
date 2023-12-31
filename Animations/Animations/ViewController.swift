//
//  ViewController.swift
//  Animations
//
//  Created by user on 11/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    private lazy var academyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 26)
        label.alpha = 0
        label.text = "TBC IT Academy"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        runAnimations()
    }
    
    // MARK: - Private Functions
    private func setUpUI() {
        view.backgroundColor = .white
        setUpMainLabel()
    }
    
    private func setUpMainLabel() {
        view.addSubview(academyLabel)
        setUpMainLabelConstraints()
    }
    
    private func setUpMainLabelConstraints() {
        NSLayoutConstraint.activate([
            academyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            academyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func runAnimations() {
        DispatchQueue.main.async {
            self.runMovementAnimation()
            self.runOpacityAnimation()
        }
    }
    
    private func runMovementAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        let startingY = self.academyLabel.layer.position.y
        animation.fromValue = CGPoint(x: self.academyLabel.center.x, y: startingY)
        let bounceSize: CGFloat = 35
        animation.toValue = CGPoint(x: self.academyLabel.center.x, y: startingY - bounceSize)
        animation.duration = 2.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        self.academyLabel.layer.add(animation, forKey: nil)
    }
    
    private func runOpacityAnimation() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.toValue = 1
        animation.duration = 2.5
        animation.repeatCount = .infinity
        animation.autoreverses = true
        self.academyLabel.layer.add(animation, forKey: nil)
    }
}


