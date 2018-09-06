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
