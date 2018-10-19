

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

 

### - Table View Type

- #### basic, Right Detail, Left Detail, Subtitle

#### Title : textLabel 속성으로 접근

#### Detail : detailTextLabel 속성으로 접근

- #### Custom : 이미지나 출력 항목을 추가하고 배열 위치를 변화시킬 수 있다.



