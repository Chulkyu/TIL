

1. HTTP

​       			   요청

​				   -----------> 

클라이언트				  	서버

​				  <------------

​					   응답



인터넷 공간에서 누군가와 어떤 정보를 주고받는 과정에는 굉장히 여러 가지 기술들이 사용되며,

많은 과정을 거치게 됩니다.

그 많은 과정 중에서 우리가 직접적으로 웹 자원을 주고받는 과정을 담당하는 영역이 존재합니다. 일반적으로 응용계층(네트워크 연결 과정)이라고 불리는 과정입니다. 이 과정에서 필요한 많은 규칙들이 존재합니다. 이 규칙을 우리는 HTTP(HyperText Transfer protocol)라고 부릅니다.

웹 상에서 사용자(클라이언트)가 누군가(서버)와 정보를 주고받기 위한 규칙이라고 이해해주시면 됩니다.

- Header : 요청 방식(Method) 알림, 사용자 정보, 브라우저 정보... 제공

  - GET 방식 : 웹 사이트에서 검색을 위한 방식(리소스를 가져오는 행위)

    	- GET 방식 대화 방법 : URL?key=value&key=value

  - POST 방식 : 헤더와 바디에 정보를 담아서 요청하는 방식 ( 로그인, 게시판, 방명록... 입력 값 전송 )

    ​				  : 서버의 데이터를 전송하고 반영된 결과 값을 돌려 받을 때 사용

- Body : 서버에 데이터를 전송할 때 데이터가 담겨지는 부분

```html
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="UTF-8">
        <title>테스트</title>
    </head>
    <body>
        <form action="" method="get/post">
            <input type="text" name="name" value="이름">
            <input type="text" name="phone" value="전화번호">
        <button type="submit">전송</button>
        <button type="reset">삭제</button>
        </form>
    </body>
</html>
```

```html
* <form></form> : 웹 상에서 입력 항목을 구성할 때 사용하는 태그 (전체 폼의 부모 역할을 하는 태그)
* <form action="목적지주소"></form> : 값 전송시 자동 호출될 서버 프로그램 주소 지정
* <form method="전송방식"></form> : 전송에 필요한 HTTP 방식 설정 (GET/POST)
* <input type="text"></input> : 속성의 값에 따라서 다양한 입력폼 구성(텍스트 입력용)
** <input name="moon"></input> : 속성의 값은 데이터 전송시 데이터의 식별자로 사용된다
* <input value="moon"></input> : 우리 눈에 기본적으로 보여지는 값(로그인, 글쓰기...)
* <button></button> : 버튼 모양을 나타내기 위한 태그
* <button type="submit"></button> : 전송(Submit) 액션용 속성
* <button type="reset"></button> : 현재 폼에 입력된 데이터를 모두 초기화
```





2. HTML (HyperText Markup Language)

   : 웹 페이지 상에 어떤 내용 혹은 정보(콘텐츠)를 표현하기 위한 구조를 작성하는 언어

   1) HTML 템플릿?

   ​	: 코드를 작성할 때 들어가는 기본 문구

   ```html
   <!DOCTYPE HTML>
   <html>
   
   ​    <head>
   
           <meta charset="utf-8">
   
   ​        <title>제목</title>
   
   ​    </head>
   
   ​    <body>
   			<h1>h1 제목입니다</h1>
         <h2>h2 제목입니다</h2>
         <p>p 문단입니다</p>
   ​    </body>
   
   </html>
   ```

   

   ```html
   * <태그>내용</태그> 이러한 형태를 요소(Element)라고 부른다.
   * <!doctype html> : 브라우저에게 "우리가 작성하는 것은 HTML5 코드야" 라고 알려주는 것
   * <html>HTML 코드</html> : HTML 코드 작성을 명시하는 태그
   * <head>정보</head> : 웹페이지에 사용된 요소들의 정보를 미리 선언하는 태그
   * <body>콘텐츠</body> : 웹페이지에 사용된 모든 콘텐츠를 담는 영역 지정
   ```

   ```html
   * <div></div> 블록(Block) 요소
   1. 줄 바꿈 속성이 있다.
   2. 다른 블록 요소를 포함할 수 없다. (예외 존재)
   3. 인라인 요소를 포함할 수 있다.
   
   <div>	<address>	<ol> <p>
   <h1>~<h6> <ul> <li> <dl>
   <dt> <area> <dd>
   ```

   ```html
   * 블록(Block) & 범용 요소
   1. 다른 블록 요소를 포함할 수 있다.
   	<div> <address> <il> <dd>
       		(p 요소만)
   ```

   ```html
   * 인라인(Inline) 요소
   1. 줄 바꿈 속성이 없다.
   2. 블록 요소를 포함할 수 없으며, 인라인 요소는 포함할 수 있다.
   
   <q> <em> <abbr> <acronym>
   <strong> <sup> <sub> <img> <a>
   <map> <area> <span>
   ```

   

   * 태그의 포함 관계?

   ```html
   엘리먼트 안에 또 다른 엘리먼트를 작성하기 위한 관계
   ```

   

   2) HTML 속성

   ```html
   * <태그 속성>콘텐츠</태그> : 특별한 설정 값을 주고 싶다!
   * <a>콘텐츠</a> : 콘텐츠에 대한 하이퍼링크(hyperlink) 지정 가능
   ```

   ```html
   * Empty 엘리먼트 : 쌍을 이루지 않는 태그, 콘텐츠와 닫는 태그가 없이 여는 태그만 존재
   * <br> : 줄 바꿈(Line Break)
   * <img> : 이미지 파일을 표현할 수 있는 태그
   	<img src="연결 주소">
   ```

   ```html
   * id 속성
   * <태그 id="아이디">콘텐츠</태그> : 하나의 페이지의 유일한 요소의 '식별자' 역할
   ```

   ```html
   * Class 속성
   * <태그 class="클래스">콘텐츠</태그> : 하나의 페이지의 다중 요소의 '식별자' 역할
   ```

   

   ```html
   * <table>콘텐츠</table> : 테이블을 표현하기 위해 사용되는 태그
   <table>
     <thead>
     	<tr>
         <th>제목1</th>
         <th>제목2</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <td>내용1</td>
         <td>내용2</td>
       </tr>
     </tbody>  
   </table>
   ```

   ```html
   * <thead></thead> : 테이블 태그의 제목 태그를 표현하기 위해 사용되는 태그
   * <tr></tr> : 테이블에서 하나의 행을 나타내기 위해 사용되는 태그
   * <th></th> : 테이블에서 제목 행의 하나의 열을 나타내기 위해 사용되는 태그
   * <tbody></tbody> : 테이블 태그의 내용 태그를 표현하기 위해 사용되는 태그
   * <td></td> : 테이블에서 내용 행의 하나의 열을 나타내기 위해 사용되는 태그
   * <tfoot></tfoot> : 테이블 태그의 요약 태그를 표현하기 위해 사용되는 태그
   * <caption></caption> : 테이블의 제목을 표현하기 위해 사용되는 태그
   ```

   

   ```html
   * ul 태그 : 콘텐츠를 목록 형태로 표현하기 위해 사용되는 태그
   <ul>
     <li>목록1</li>
     <li>목록2</li>
     <il>목록3</il>
   </ul>
   <ol>
     <li>목록1</li>
     <li>목록2</li>
     <il>목록3</il>
   </ol>
   * ul 태그 vs ol 태그?
   Unordered HTML List vs Ordered HTML List
   (.목록1 .목록2 .목록3) vs (1.목록1 2.목록2 3.목록3)
   ```

   ```html
   * 열 합치기
   <table>
               <thead>
                   <tr>
                       <th>이름</th>
                       <!--열 합치기-->
                       <th colspan="2">나이</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>문성재</td>
                       <td>20살이라면...</td>
                       <td>20살이라면...</td>
                   </tr>
               </tbody>
   </table>
   ```

   ```html
   * 행 합치기
    <table>
           <thead>
               <tr>
                   <th>이름</th>
                   <th>문성재</th>
               </tr>
           </thead>
           <tbody>
               <tr>
                   <!-- 행 합치기-->
                   <td rowspan="2">나이</td>
                   <td>20살이라면...</td>
               </tr>
               <tr>
                   <td>20살이라면...</td>
               </tr>
           </tbody>
   </table>
   ```




* 정적 자원(Static Resource)?

  : 사용자의 행동이나 입력 등에 의존적이지 않은 콘텐츠

  ex) 이미지 파일(.png, .jpg(jpeg), .gif)

  - HTML 파일 경로 (절대 경로 vs 상대 경로)

    : 이미지 자원을 저장하는 경로(위치)를 지정

    - 절대 경로

      : 자원의 절대적 위치를 지정 (http://, https://로 사용 가능)

    - 상대 경로

      : 현재 페이지의 위치를 기준으로 상대적 경로를 지정 

      <img src="image.jpg"> : 현재 페이지와 같은 폴더 내의 이미지가 존재

      <img src="subfolder/image.jpg"> : 현재 페이지의 하위 폴더 내의 이미지가 존재

      <img src="../image.jpg"> : 현재 페이지의 상위 폴더 내의 이미지가 존재

      

* 정적 페이지 : 클라이언트의 요청에 이미 만들어진 HTML 페이지를 응답 (블로그, 자기 소개 페이지 등)

* 동적 페이지 : 클라이언트의 요청에 실시간으로 페이지의 변화를 응답 (게시판, 방명록 등)