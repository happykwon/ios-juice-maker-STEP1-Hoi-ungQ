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
1. 프로토콜 정의
어떤 동작을 수행할지를 구현하는 protocol을 구현,
```swift
protocol MainViewControllerDelegate: AnyObject {
    func updateFruitLabels()
}
```

2. 델리게이트 프로퍼티 선언
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













