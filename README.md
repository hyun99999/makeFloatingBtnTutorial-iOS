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
**UIView animate**
```swift
UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            })
//클로저가 축약 가능.
UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 0
            }
```
//series of animation
```swift
UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }) {(_) in
                self.floatingDimView.isHidden = true
            }
```

### 완성
<img src ="https://user-images.githubusercontent.com/69136340/111800886-bdfe3380-890f-11eb-8603-b743c756148a.png" width ="250">
<img src ="https://user-images.githubusercontent.com/69136340/111800883-bd659d00-890f-11eb-8812-3344c0804221.png" width ="250">


### 출처
출처|https://swieeft.github.io/2020/03/21/FloatingButton.html
