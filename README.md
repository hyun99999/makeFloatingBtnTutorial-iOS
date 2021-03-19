# makeFloatingBtnTutorial-iOS
외부 라이브러리를 사용하지 않고 floatingButton 을 만드는 튜토리얼

- stackView 사용해서 floating Button 구현.

**Main.storyboard 설정**
- 메뉴 버튼 만들고 스택뷰로 감싼다. 초기상태를 만들어주기 위해서 Hidden 상태로 변경해준다.

### 코드 구현
**show animation**
```swift
// lazy var buttons: [UIButton] = [self.shareBtn, self.removeBtn, self.editBtn]

buttons.forEach { [weak self] button in
    button.isHidden = false
    button.alpha = 0

    UIView.animate(withDuration: 0.3) {
        button.alpha = 1
        self?.view.layoutIfNeeded()
    }
}
```
**hide animation**
```swift
buttons.reversed().forEach { button in
    UIView.animate(withDuration: 0.3) {
        button.isHidden = true
        self.view.layoutIfNeeded()
    }
}
```
### 완성
<img src ="https://user-images.githubusercontent.com/69136340/111589308-07635b80-8808-11eb-942d-95675ce16c23.png" width ="250">
<img src ="https://user-images.githubusercontent.com/69136340/111589307-06cac500-8808-11eb-958a-3055a75fdd2d.png" width ="250">

### 출처
출처|https://swieeft.github.io/2020/03/21/FloatingButton.html
