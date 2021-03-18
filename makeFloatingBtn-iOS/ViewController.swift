//
//  ViewController.swift
//  makeFloatingBtn-iOS
//
//  Created by kimhyungyu on 2021/03/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var floatingBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    // 메뉴버튼 배열 만들기
    lazy var buttons:[UIButton] = [self.shareBtn, self.removeBtn, self.editBtn]
    
    // 플로팅 버튼 상태 flag
    var isShowFloating: Bool = false
    
    lazy var floatingDimView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor(red:0, green: 0, blue: 0, alpha: 0.5)
        view.alpha = 0
        view.isHidden = true
        
        self.view.insertSubview(view, belowSubview: self.floatingStackView)
        
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func floatingButtonAction(_ sender: UIButton) {
        if isShowFloating {
            // hide animation
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }) {(_) in
                self.floatingDimView.isHidden = true
            }
            
        } else {
            self.floatingDimView.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 1
            }
            buttons.forEach { [weak self] button in
                button.isHidden = false
                button.alpha = 0
                
                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        isShowFloating = !isShowFloating
        
        // rotation
//        let image = isShowFloating ? UIImage(named: "Hide") : UIImage(named: "Show")
//                let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity
//
//                UIView.animate(withDuration: 0.3) {
//                    sender.setImage(image, for: .normal)
//                    sender.transform = roatation
//                }
    }
}

