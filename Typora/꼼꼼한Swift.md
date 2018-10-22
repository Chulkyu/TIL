

# *8.1 TableViewController

### - 테이블 뷰 컨트롤러를 이용하여 수평적 관계의 카데고리나 콘텐츠를 병렬로 배열하고, 수직적 관계로 세부한 정보들을 내비게이션 컨트롤러를 통하여 직렬ㄹ로 표현.

### - 하나의 화면을 의미하는 씬(Scene)은 보통 하나의 뷰 컨트롤러(1)로 구성.

### - 1. TableViewController

### 		- 2)Table View : 최상위 루트 뷰 (화면으로 접하는 모든 컨트롤들이 배치된 곳)

### 	- 2-1)Section

###				- 3)Table View Cell : 테이블의 여러 개의 행

### 			- 4)Content View : 각 행의 내부 컨텐츠 뷰

### - TableViewController -> TableView -> Section -> TableViewCell -> ContentView

---

## 8.2 Prototype Cells

### 테이블 뷰의 셀을 원하는 대로 쉽게 디자인 할 수 있게 도와주는 객체

### Button, Label 과 다르게 직접 데이터를 표시하거나 화면에 공간을 차지하지 않고, 셀의 구성을 미리 보여주기 위한 가상의 틀.



![Screen Shot 2018-10-19 at 4.51.52 PM](/Users/maru/Desktop/Github/TIL/Typora/img/SwiftSeries/TableViewController/Screen Shot 2018-10-19 at 4.51.52 PM.png)

###    |----Image----||-------------------Text---------------------|

###    |------------------------ cell content ------------------------||Accessory view|

- ### Cell Content : 셀에 표현될 콘텐츠, 디바이스에 따라 너비가 가변적으로 처리

- ### Accessory View : 콘텐츠의 부가 정보 여부를 암시, 너비는 항상 고정값



### - Edit 눌렀을 때

####    |Editing control||------------------- cell content -----------------||Reordering control|

- #### Editing control : (+), (-) 버튼

- ####Reordering control : 셀 순서 재배치 컨트롤 제공

 

### - Table View Cell Accessory

- #### basic, Right Detail, Left Detail, Subtitle

#### Title : textLabel 속성으로 접근

#### Detail : detailTextLabel 속성으로 접근

- #### Custom : 이미지나 출력 항목을 추가하고 배열 위치를 변화시킬 수 있다.



### - Table View Content

- ### static Cells : cell 각각을 프로그래밍적으로 구성하지 않고 스토리보드에서 직접 구성. <br>ex)설정화면 - 각 항목이 프로그래밍적으로 늘어나거나 줄어들 일이 없다.<br>필요한 콘텐츠를 스토리보드에서 직접 올려서 구현 가능

- ### dynamic prototypes : 고정되지 않고 매번 갱신되는 내용을 표현할 때.<br>DataSource를 테이블 뷰 각 행에 연결하는 과정인 데이터 바인딩(Data Binding)이 필요<br>*DataSource : 테이블 뷰의 각 행마다 대응할 수 있도록 배열 형태이기만 하면 데이터 소스가 된다.

---



## 8.3.1 데이터 소스 만들기

####*Value Object 패턴<br>데이터 저장을 전담하는 클래스를 별도로 분리하는 설계 방식. 줄여서 VO.<br>쉽게 식별하기 위하여 클래스 이름 마지막에 VO를 붙인다.<br>ex) 필요한 데이터를 담는 프로퍼티를 각 음식 그릇이라 하고 VO 클래스는 쟁반.<br>각 음식 그릇을 따로 옮길 필요 없이 쟁반에 올려서 다 같이 전달.



```swift
import UIKit

class ListViewController: UITableViewController {
   
    
    
    //테이블 뷰를 구성할 리스트 데이터
    var list = [MovieVO]()
    
    override func viewDidLoad() {
        // 첫번째 행
        var mvo = MovieVO()
        mvo.title = "다크나이트3"
        mvo.description = "프랑스에서 3시간을 불어로 봄..."
        mvo.opendate = "2012-07-23"
        mvo.rating = 8.9
        // 배열에 추가
        self.list.append(mvo)
        
        // 두번째 행
        mvo = MovieVO()
        mvo.title = "호우시절"
        mvo.description = "때를 알고 내리는 좋은 비"
        mvo.opendate = "2009-10-08"
        mvo.rating = 7.31
        // 배열에 추가
        self.list.append(mvo)
        
        // 세번째 행
        mvo = MovieVO()
        mvo.title = "말할 수 없는 비밀"
        mvo.description = "여기서 너까지 다섯 걸음"
        mvo.opendate = "2015-05-07"
        mvo.rating = 9.19
        // 배열에 추가
        self.list.append(mvo)
    }
    
}

```



- ### 리팩토링

### - 코드의 결과나 성능에는 영향을 미치지 않고 단지 가독성과 유지 보수의 편의를 위해 더 세련되고 구조화된 코드로 변경하는 것

### - 저장할 data를 튜플로 정리하고 MovieVO 클래스를 객체화 시켜서 저장시킨다.

```swift
import UIKit

class ListViewController: UITableViewController {
    // 튜플 아이템을 가진 배열로 정의된 데이터 세트
    var dataset = [("다크나이트3", "프랑스에서 3시간을 불어로 봄...", "2012-07-23", 8.9), ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31), ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19)]
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()
   
    override func viewDidLoad() {
        
    }
    
}
```

### * lazy var list 에서 lazy를 붙여준 이유

- ### 미리 생성해서 메모리를 낭비할 필요가 없다.<br>lazy 키워드를 붙여서 변수를 정의하면 참조되는 시점에 맞추어 초기화되므로 메모리 낭비를 줄일 수 있다.

- ####lazy 키워드를 붙이지 않은 프로퍼티는 다른 프로퍼티를 참조할 수 없다.<br>list 배열 변수를 초기화 할 때 dataset 프로퍼티를 참조해야 하기 때문.<br>(lazy 키워드 안쓸 경우 : 프로퍼티들이 초기화되는 순서는 우리가 컨트롤할 수 있는 범위를 벗어나기 때문에 list 배열 변수의 클로저가 실행되는 시점에 dataset 배열이 초기화되어 있다고 보장할 수 없기 때문에 일반 저장 프로퍼티끼리는 서로 참조 불가능)

###- lazy 프로퍼티 : 다른 일반 프로퍼티들이 초기화된 후 맨 마지막에 초기화.<br>초기화되는 시점도 통제 가능. 따라서 lazy 키워드가 붙은 프로퍼티의 초기화 클로저 구문 내에서 다른 일반 프로퍼티 참조 가능

---



## 8.3.2 테이블 뷰와 데이터 소스 연동

###*반드시 필요한 내용

- ### 테이블이 몇 개의 행으로 구성되는지? <br>tableView(_:numberOfRowsInSection:) : 몇 개의 행을 생성해야 할지 우리가 iOS 시스템에게 알려주기 위한 메소드

- ### 각 행의 내용은 어떻게 되는지?<br>tableView(_:cellForRowAt:) : 각 행이 화면에 표현해야 할 내용을 구성하는데 사용

- ### 셀 선택시 실행할 액션<br>tableView(_:didSelectRowAt:) : 사용자가 셀을 선택했을 때 실행할 액션 정의

