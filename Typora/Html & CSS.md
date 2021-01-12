# Html & CSS

### 

### HTML & CSS & JS

```
HTML : 웹사이트를 구성하는 뼈대, 콘텐츠
CSS : 콘텐츠를 어떻게 보여지게 하는지, 디자인
JS : 콘텐츠들의 상호작용
```

```
HTML만으로 웹사이트 구성 가능

```

### CSS

```
HTML 코드 안에 직접 입력
CSS 파일 따로 만들어 작성 - (권장)

블럭 성질 : 대부분 요소는 블럭 성질, 옆에 아무것도 올 수 없음, 높이,너비 가질 수 있음
					마진, 패딩 상하좌우 가능
인라인 성질 : 옆에 다른 인라인 요소 존재 가능
					 마진, 패딩 좌우만 가능,
					 상하를 조정하려면 블럭 성질로 바꿔야함(display: block; or inline-block;)
flex : 자식이 아니라 부모에게 말해라
			 div를 조정하고 싶으면 body에 display: flex;
			 display: inline-block; -> 문제가 많아서 권장 X
			 justify-content : 주축 (수평,수직 가능) / align-items : 교차축
			 flex-direction: row;(디폴트, 주축-수평) / column;(주축-수직)
			 
position: fixed; -> 모든 것의 위에 위치 / 스크롤 상관 없이 화면에서 위치 고정
position: relative; -> 엘리먼트가 처음 위치한 지점 기준으로 위치 조정 가능
position absolute; -> 엘리먼트를 원하는 좌표로 이동 가능, relative로 지정된 부모 안에서.

p span { color: teal; } -> p 안에 있는 모든 span을 지정
p > span { color: teal; } -> p 바로 밑의 child span을 지정
p + span { color: teal; } -> p 바로 다음의 span을 지정, 사이에 다른 요소가 있을시 적용 되지 않음
p ~ span { color: teal; } -> p 다음에 있는 span을 지정, 몇 번째이든 상관 없음

input:required { border-color: tomato; } -> input 중 required라는 조건을 가졌을 때 설정 변경
input[placeholder="name"] { background-color: tomato; } -> placeholder="name" 인 요서 설정 변경
input[placeholder~-="name"] { background-color: tomato; } -> placeholder 중 name을 가진 모든 요소 설정 변경

 :root { --main-color: #fff; 
 				 --default-border: 1px solid white; }  -> 지정값을 저장해놓고 필요한 곳에 불러서 적용 가능
 p { background-color: var(--main-color); }
 
 transition -> 애니매이션 효과, state가 아니라 요소 안에 입력해야한다.
 a { transition: all 5s ease-in-out; }
 
 애니메이션 계속 적용 ->
 @keyframes 애니메이션이름 {
 from { transform: rotateX(0); }
 to { transform: rotateY(180deg) translateX(100px); }
 }

원하는 요소에 적용 ->
img { animation: 애니메이션이름 5s ease-in-out infinite; }
						

```

