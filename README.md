# TIL
Today I Learned

# git을 쓰는 이유?

* 버전 관리는 쉽고 효율적으로 하기 위해서
* 네트워크에 접근하거나 중앙서버에 의존하지 않고도 사용 가능
* 현재 코드가 어떤 맥락을 거쳐서 지금 상태가 되었는지 변경사항 추적
* 소스 코드를 누가 수정했는지 파악
* 문제가 생겼을 때 이전 버전으로 돌리는 기능 제공
* 코드 백업 기능 수행
* 여러 사람이 협업 시, 코드의 동기화 수행 / 코드 충돌과 유실 방지
* 히스토리만으로 문서화 역할
* 파일 이름을 변경(리네임)하지 않고도 버전 관리 가능
* 백업 기능
* 이전 버전으로 리커버리 가능

### git local 변경사항 -> 온라인(마스터) 적용 과정
1. git add : 수정사항(파일) 중 적용시킬 파일을 정하는 과정*(스테이징)
  * git add <filename> / git add : all files

2. git commit : 수정해서  add한 파일을 저장
  * git commit -m "commit message"

3. git push : commit 한 파일을 master branch 위에 올리는것
  * git push origin master
  
* git pull : git pull origin master // 마스터에서 변경사항 가져오기

# Terminal (CLI)

### * Shell : 사용자와 운영체제 (커널) 간에 대화를 가능하게 해주는 명령어 해석기

#### - 사용자 (명령) --> 셀 (해석) --> 커널 (명령 수행 후 결과 전송) --> 셀 (해석) --> 사용자 (결과 확인)

### * Kernel : 운영 체제의 핵심 역할

#### - 하드웨어 관리, 필요한 프로세스에 전달 등 여러 시스템 자원 제어

#### - 컴퓨터 부팅시 부트 로더에 의해 로드되어 항상 메모리에 상주

#### - 프로세서, 프로세스, 하드웨어, 메모리, 파일 시스템, 네트워크 등을 관리

#### - 인터럽트 처리기, 스케쥴링(처리 순서 결정), 수퍼바이저(사용권 부여) 등이 포함



### * Terminal Command

#### - ls : 목록 보기 / ls -a : 숨긴 파일까지 보기 / ls -al : 상세설명까지 보기 

#### - cd "directory": 경로 이동 / cd .. : 상위 경로로 이동

#### - pwd : 현재 경로 확인

#### - mkdir "name": 폴더 생성 / rmdir "name" : 폴더 삭제 <폴더 안에 파일 있으면 삭제 X>

#### - touch "name" : 파일 생성 / rm "name" : 파일 삭제 / rm -rf "directory" : 폴더 안의 파일도 같이 삭제

#### - cp 복사할파일명 복사될파일명 : 파일 복사 (파일명 변경 가능)

#### - mv 변경전파일명 변경후파일명 : 파일명 변경

#### - mv ../파일명 : 파일을 상위폴더로 이동

#### - mv -v "directory" ... 이동할폴더 : 폴더 위치 이동

#### - nano : 파일에 내용 입력하기 위한 커맨드

#### - cat : 파일 안에 내용 확인

#### - head -n 5 : 파일 위에서 5번째 줄까지 내용 확인

#### - man "command" : 명령어 메뉴얼 확인

#### - more : 파일의 내용을 한번에 한 화면씩 보여준다.

#### - kill : 어플리케이션 실행 중지 / ps : '죽이고' 싶은 어플의 정확한 프로세스 ID 확인

#### - sudo : 일반 사용자가 어플을 설치해야 할때, 루트 권한을 임시로 부여(패스워드를 입력해야 한다.)

#### - passwd : 패스워드 변경, 현재 패스워드와 새로운 패스워드 입력

# Make a Github page
#### - add content to new pages site


# Xcode (IDE, Integrated Development)

#### playground

##### - 코드 작성 후 결과 바로 확인 가능

##### - 주석 /// (Quick help) : description까지 볼 수 있음

##### - command + option + / :

##### - ';' 세미콜론 생략 가능, 한 라인에 여러 구문(다중 명령)을 사용하고 싶을 경우는 세미콜론 필수

#### * Naming : 영어 외에도 유니코드 문자를 포함한 대부분 문자 사용 가능

##### - 변수명의 목적이 무엇인지 알 수 있도록 확실하게 (길어도 상관 없다)

##### - 선언 전에는 사용 불가

##### - let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

#### * 변수로 사용할 수 없는 이름

##### 1. 같은 스코프 범위 내에서 중복되는 이름 : 같은 (), {}, [] 안에서 중복 X

##### 2. 공백문자 : 단어사이 띄워쓰기 X

##### 3. 수학 기호 (√, ∑ 등)

##### 4. 화살표 (→, ← 등)

##### 5. 숫자로 시작하는 이름 (시작 부분 외에는 사용 가능)

#### * Type Annotation

##### - 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것

#### * Type Inference

##### - 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수 타입을 추론하여 적용

##### - 변수 선언 시 value 값을 나중에 지정해 주려고 할 때는 타입을 지정해주어야 한다. // let language: String 

##### 				language = "Swift 4"



#### * Literals

##### - 소스 코드의 고정된 값을 대표하는 용어.

##### - 정수 / 실수 / 문자 / 문자열 / 불리언 등

##### - 2^16 범위 : -2^15 ~ 2^15 -1

##### - let q2: Int8 = Int8.max + 1 : 타입을 명시해주면 컴파일러가 돌아가기 전에 에러 확인 가능

##### - let q2 = Int8(127 + 1) : 실행시켜 보기 전에는 에러 확인 불가능

##### - 01111111 --> 1000000 : int8 최대값에 +1을 하면 음수로 변환되기 때문에 오류 발생

##### - Int8.max &+ 1 : Int8.min

##### - Int8.min &- 1 : Int8.max

#### * Type Conversion

##### - magnitude 와 abs 의 차이점은?

##### : type이 변한다. magnitude: UInt

##### : abs: Int

##### - 양수를 사용할 때 Int / UInt 중 어느 것이 좋을까? (사용성, 안전성, 타입 추론, 변환 등)

##### : Int (일반적으로 범용적으로 Int를 많이 쓴다)

### * Basic Operators

##### - 단항 연산자 : 연산자에 피연산자가 1개

##### - 이항 연산자 : 피연산자가 2개

##### - 삼항 연산자(Ternary Operation) :  a > 0 ? "positive" : "negative" (If 조건문과 동일)

#### * Comparison Operators

##### - 숫자가 아닌 문자열에 대한 비교는 ? : 아스키, 유니코드에 주어진 코드값에 의해 크기 결정

##### - && : 둘 다 true => true

##### - ll : 둘 중 하나만 true여도 true

##### - true ll  : 뒤의 조건은 확인하지 않고 true



#### * Range Operation

##### - for i in 1...100.reversed() { print(i) } : 100부터 1까지 거꾸로 반복



### * Function

#### - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것

##### - Input 과 Output 이 모두 있는 것 (Function)

##### - Input 이 없고 Output 만 있는 것 (Generator)

##### - Input 이 있고 Output 은 없는 것 (Consumer)

##### - Input 과 Output 이 모두 없는 것

#### * func someFunction(argumentLabel parameterName: Int)

#### Q) 왜 Argument Label - Parameter Name 따로 쓰는지?

##### - 외부/내부에서 함수 용도(의미)/수식을 이해하기 쉽도록

##### - argumentLabel : 함수를 외부에서 호출해서 쓸 때

##### - parameterName : 내부에서 매개변수 이름

##### ex) 5.distance(to: 10)



### * Typealias

##### - typealias <#type name#> = <#type expression#>

##### ex) typealias AudioSample = UInt16

##### - 타입을 어떤 경우에 이렇게 쓰려고 했는지 나중에 알기 쉽게 하기 위해서 타입이 어디에 쓰일지를 이름으로 붙여두는것
