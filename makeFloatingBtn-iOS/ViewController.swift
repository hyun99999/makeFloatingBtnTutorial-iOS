//
//  ViewController.swift
//  makeFloatingBtn-iOS
//
//  Created by kimhyungyu on 2021/03/18.
//

import UIKit

class ViewController: UIViewController {
//MARK: -  @IBOutlet
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var floatingBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    // 메뉴버튼 배열 만들기
    lazy var buttons:[UIButton] = [self.shareBtn, self.removeBtn, self.editBtn]
    
    // 플로팅 버튼 상태 flag
    var isShowFloating: Bool = false
    
    // app don't know if user using floatingBtn or not until it clicks
    lazy var floatingDimView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.alpha = 0
        view.isHidden = true
        
        self.view.insertSubview(view, belowSubview: self.floatingStackView)
        
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }
    //MARK: - @IBAction
    // floatingButtonAction
    @IBAction func floatingButtonAction(_ sender: UIButton) {
        if isShowFloating {
            // hide animation
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.5) {
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
                
                UIView.animate(withDuration: 0.5) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        isShowFloating = !isShowFloating
        
        // rotation
        let image = isShowFloating ? UIImage(systemName: "plus.circle.fill") : UIImage(systemName: "plus.circle.fill")
        let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity

        UIView.animate(withDuration: 0.3) {
            sender.setImage(image, for: .normal)
            sender.transform = roatation
        }
    }
    //추후 버튼을 누르는 onclicked함수를 만들고 매개변수로 버튼의 변수명과 액션메서드를 받아서 내용은 버튼에 액션 추가메서드를 작성하면 모든 버튼에 적용가능하지 않을까??->라이브러리화
    @IBAction func editBtnClicked(_ sender: UIButton) {
        //UIView.animate 에서 값의 변경에 대한 애니메이션이 기본값으로 되는 듯.
        hideFunc()
        textLabel.text = "수정하기"
    }
    @IBAction func removeBtnClicked(_ sender: UIButton) {
        hideFunc()
        textLabel.text = "삭제하기"
    }
    @IBAction func shareBtnClicked(_ sender: UIButton) {
        hideFunc()
        textLabel.text = "공유하기"
    }
    
    //MARK: - methods
    func hideFunc() {
        buttons.reversed().forEach { button in
            UIView.animate(withDuration: 0.5) {
                button.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.floatingDimView.alpha = 0
        }) {(_) in
            self.floatingDimView.isHidden = true
        }
        isShowFloating = !isShowFloating
        
        //rotation
        let image = isShowFloating ? UIImage(systemName: "plus.circle.fill") : UIImage(systemName: "plus.circle.fill")
        let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity

        UIView.animate(withDuration: 0.3) {
            self.floatingBtn.setImage(image, for: .normal)
            self.floatingBtn.transform = roatation
        }
    }
}

