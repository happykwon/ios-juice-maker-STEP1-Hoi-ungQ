# ios-juice-maker
쥬스메이커 프로젝트 저장소입니다. 
개발기간 2023.12.05 ~ 12.22

## Step 1 : 쥬스 메이커 타입 정의
- Dictionary의 key : value 값을 활용한 FruitInventory구현
- 에러타입 정의 및 LocalizedError에러 구현 
- 쥬스 제조에 필요한 필요 수량을 Enum타입에 정의

## Step 2 : 초기화면 기능구현
- protocol 기본 구현을 활용해 Alert을 호출 구현
- Delegate Pattern을 활용한 데이터 및 화면 전달
- do - catch 문을 활용한 에러처리
- UIButton의 Tag를 활용한 각 테그별 분기처리
- NavigationCotroller를 활용한 화면 이동

---

## 배운점 
### Delegate Pattern을 통한 데이터 전달 방식
- Deleage Pattern는 객체간 어떤 데이터를 공유 또는 이벤트(터치 등)의 처리를 위해 위임자를 지정하는 것
- 관습적으로 Anyobject키워드를 사용함
1. 클레스의 인스턴스임을 보장하여 실수를 줄일 수 있음(타입의 안정성 유지, 값타입(구조체,열거형 등 )에서는 사용 불가)
2. 어떤 클래스 인스턴스라도 해당 ptorocol을 준수할 수 있도록 함
3. Objective-C와의 호환성(Objective-C에서는 모든 객체가 클레스의 인스턴으로 되어있어 활용할 수 있음)
- 다음과 같은 순서로 보통 진행됨
**1. 프로토콜 정의**

어떤 동작을 수행할지를 구현하는 protocol을 구현,
```swift
protocol MainViewControllerDelegate: AnyObject {
    func updateFruitLabels()
}
```

**2. 델리게이트 프로퍼티 선언**
```swift
 weak var delegate: MainViewControllerDelegate?
```

위임자 클레스 내부에 델리게이트 프로퍼티를 선언 보통은 weak(약한참조)로 선안한다.
weak를 사용하면 순환참조를 방지할 수 있다.

> Delegate Pattern 강한참조 코드 예시
```swift
>protocol SomeDelegate: AnyObject {
    func doSomething()
}

class SomeClass {
    var delegate: SomeDelegate?
    
    func triggerAction() {
        delegate?.doSomething()
    }
}

class DelegateClass: SomeDelegate {
    func doSomething() {
        print("Delegate method called.")
    }
}

let someClassInstance = SomeClass()
let delegateInstance = DelegateClass()

someClassInstance.delegate = delegateInstance
someClassInstance.triggerAction()
```
**3. 델리게이트 메서드 호출**

위임자 클레스에서 델리게이트 프로토콜에 정의된 메서드를 호출(특정 이벤트나 원하는 순간)
```swift
    func updateStepperLabel() {
        delegate?.updateFruitLabels()
    }
```
**4. 델리게이트 클레스 구현**

보통 extention을 활용
```swift
extension MainViewController: MainViewControllerDelegate {
     func updateFruitLabels() {
        strawberry.text = "\(fruitStore.fruitInventory["딸기"] ?? 0)"
        banana.text = "\(fruitStore.fruitInventory["바나나"] ?? 0)"
        pineapple.text = "\(fruitStore.fruitInventory["파인애플"] ?? 0)"
        kiwi.text = "\(fruitStore.fruitInventory["키위"] ?? 0)"
        mango.text = "\(fruitStore.fruitInventory["망고"] ?? 0)"
    }
}
```
**5. 델리게이트 설정**

위임자의 델리게이트 프로퍼티에 인스턴스를 할당하여 위임자가 델리게이트 메서드를 호출할 수 있게 해줌
```swift
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        if let fruitStore = fruitStore {
            fruitStore.fruitInventory["딸기"] = Int(sender.value)
            updateStepperLabel()
            initStepperValue()
        }
    }
```

### NavigiontController를 활용
NavtionCotroller는 ViewController간의 이동을 관리해주는 컨테이너ViewController이며, 선입 후출 방식의 stack으로 화면을 관리해줌 
- 애플이 구현해놓은 Navgtionbar를 활용해 구현 가능
- 직관적인(유저친화적)네이비게이션 구현 가능
- 커스텀을 통해 서비스에 적합한 디자인으로 변경해도 기존 앱들과의 UX를 제공할 수 있어 유저들이 더욱 쉽게 활용 가능

### modal과 push의 차이점 

modal과 push 화면전환 전환방식을 말하며 각각 특징이 있어 적제적소에 사용해 유저에게 일관적인 경험을 제공해줘야함
**modal**
- Modal은 현재의 컨텍스트를 유지하고 일시적인 정보를 보여주거나, 특정 정보를 받는 등 흐름을 끊지 않고 다른 컨텍스트를 보여줄때 사용
- NavtigationController의 스텍에 쌓이지 않음 
예) 쿠팡앱을 처음 실행하면 화면 하단에 모달로 이벤트 정보, 경고 등

**Push**
- stack에 쌓이며 선입후출 구조로 화면이 구성된다.
- 뒤로가기 버튼이 자동적으로 이미 구현되어있다.
- 새로운 내용의 페이지를 전달할 때 사용하거나 계층적인 구조의 정보를 전달할때 효과적이다.











