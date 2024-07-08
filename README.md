# 소동(SODONG) 프로젝트

<b>3조 김주성, 문지은, 박진우, 이찬희, 전혜린 </b>

---
## 목차
- 프로젝트 개요
- 팀원 소개
- 기술 스택
- 주요 기능
- 트러블 슈팅
- 개발 일정
- 업데이트 예정

## 프로젝트 개요

<img src="./src/main/resources/static/assets/img/main/c-main-logo.png" alt="sodong-logo" width="300" height="300">

- 소동(SODONG)은 '서울에서 일어나는 작은 소동'이라는 뜻으로, 서울에서 다양한 동호회 활동을 즐길 수 있는 플랫폼입니다.
  <br> 이 프로젝트는 사용자들이 신뢰도 높은 동호회를 찾고 참여할 수 있도록 도와줍니다.
- 기존에 있던 "소모임"이라는 어플리케이션을 사용해보면서 더 추가되었으면 좋겠다고 생각했던 기능을 만들고 싶었습니다.
  <br>각 회원별로 온도시스템을 도입하여 동호회를 가입하고 활동을 즐기는 과정에서 절차적으로 조금 더 복잡해질 순 있지만,
  <br>이러한 인증과정을 통해 더 신뢰 있고 매너있는 동호회 활동을 즐길 수 있게끔 유도했습니다.
  
## 팀원 소개
|   팀원    | 담당         |깃허브|
|:-------:|------------|---|
| 이찬희(팀장) | BACK,FRONT |https://github.com/chanhee7|
|   박진우   | BACK,FRONT  |https://github.com/JinWooP98|
|   문지은   | BACK,FRONT  |https://github.com/mizmizzz|
|   김주성   | BACK,FRONT  |https://github.com/kkimjuseong|
|   전혜린   | BACK,FRONT  |https://github.com/hyerin11|

## 기술 스택
<p align="left">
  <img src="https://camo.githubusercontent.com/48813940da08908dfd85d01253d0cc454e9c8401726cc1efd3ed324bd831f7ab/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4a4156412d3030373339363f7374796c653d666f722d7468652d6261646765266c6f676f3d4a617661266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/93aa4e34059be462658f5f9d7fd5ad72974d57fd1a629dac4d1376a5482f5002/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4a6176615363726970742d4637444631453f7374796c653d666f722d7468652d6261646765266c6f676f3d4a617661536372697074266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/6a6a85d19cab8142db590f61939fb8f765f8ce1b7e0a000b657ef712a8eb5c6c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f537072696e672d3644423333463f7374796c653d666f722d7468652d6261646765266c6f676f3d537072696e67266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/6a2624c36b0206b1adb57efb6ed4c54608bb12d65e84a9a7e4a7d95c21f4ee96/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f48544d4c352d4533344632363f7374796c653d666f722d7468652d6261646765266c6f676f3d48544d4c35266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/a52247f036401f60302cf6bc87216f445b80298b227068dbfb0568c2c3aa2500/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f435353332d3135373242363f7374796c653d666f722d7468652d6261646765266c6f676f3d43535333266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/46cb7c4fea294e4191a9493a02ceee24f5781339c94116a601818a160ebf5a74/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4d7953514c2d3434373941313f7374796c653d666f722d7468652d6261646765266c6f676f3d4d7953514c266c6f676f436f6c6f723d7768697465">
  <img src="https://camo.githubusercontent.com/837b039bfeae926bbadf45553bf4522b279c9ccf60eba3fffa014cc84f37112e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6769746875622d3138313731373f7374796c653d666f722d7468652d6261646765266c6f676f3d676974687562266c6f676f436f6c6f723d7768697465">
</p>

## 주요 기능

### 메인페이지 - 이찬희
1. **동호회 순위 확인**
    - 소동에서 가장 회원이 많은, 가장 최근에 생긴, 가장 소모임이 많은 동호회 순위를 확인할 수 있습니다.
2. **통계 정보 확인**
    - 소동의 총 가입자 수, 총 동호회 갯수, 총 소모임 갯수를 확인할 수 있습니다.
3. **카테고리별 동호회 리스트**
    - 원하는 카테고리에 포함된 동호회 리스트만 필터링하여 확인할 수 있습니다.

#### 메인페이지 사용 예시
1. **비로그인 유저**
    - 인트로 페이지로 회원가입을 유도합니다.
    - 메인페이지 둘러보기 기능을 사용할 수 있습니다.
2. **로그인 유저**
    - 로그인 유저일 경우 자동으로 메인페이지로 리디렉션하여 메인페이지를 이용할 수 있습니다.

### 공지사항
1. **신규 및 업데이트 소식 확인**
    - 소동 서비스의 신규 기능 및 업데이트 소식을 확인할 수 있습니다.
2. **공지사항 관리**
    - 페이지 관리자만 공지사항을 작성하고 삭제할 수 있습니다.
  
<hr>

### 동호회(소동) 페이지 - 김주성

1. **게시판 생성 및 삭제 기능**
    - 생성: 모든 이용자는 새로운 게시판을 생성할 수 있습니다. 게시판 생성 시, 게시판의 제목, 설명, 대회참여여부 등을 선택할 수 있습니다.
    - 삭제: 게시판 관리자는 게시판을 삭제할 수 있습니다. 삭제 과정에서 게시판의 모든 데이터가 숨김 처리가 되며 데이터베이스에 숨김처리로 저장이 됩니다..

2. **게시판 권한에 따른 디테일 페이지 구성**
    - 게시판에 접근할 수 있는 권한(일반 사용자, 회원, 관리자)에 따라 다른 디테일 페이지를 보여줍니다. 예를 들어, 비 로그인한 회원은 2개의 디테일 페이지중 동호회 정보만 볼 수 있는 페이지로 이동하고 멤버 이상의 권한을 가진 사람은 동호회 정보와, 공지사항, 자유게시판 등 전체 페이지가 보이는 경로로 이동합니다.

3. **게시판 권한에 따른 가입 신청 처리**
    - 비회원 이나 이미 가입한 회원은 게시판 가입을 신청할 수 있습니다. 가입 신청 시 사용자는 필요한 정보(이름, 온도 등)를 제출해야 합니다.

4. **게시판 관리자만 가입 승인**
    - 게시판 관리자는 가입 신청을 검토하고 승인하거나 거절할 수 있는 권한을 가집니다. 관리자는 신청자의 정보를 검토하여 게시판의 규칙과 목적에 부합 하는지 결정합니다.

5. **게시판 멤버 가입 및 탈퇴**
    - 멤버는 언제든지 자신의 의사에 따라 게시판을 탈퇴할 수 있습니다. 탈퇴 시 모든 개인 정보와 사용자 데이터는 탈퇴함 처리가 되어 저장됩니다.
    - 새로운 사용자는 게시판 목적성등을 보고 가입할 수 있습니다.

6. **게시판 관리자가 추방 기능**
    - 관리자는 게시판의 규칙을 위반하거나 부적절한 행동을 한 사용자를 게시판에서 추방할 수 있습니다.

7. **대회 참여 시 대회 이미지 생성**
    - 사용자가 대회에 참여할 때, 해당 대회의 로고나 이미지가 생성되어 사용자의 프로필이나 대회 페이지에 표시됩니다. 이는 대회의 정체성을 강화하고 참가자들에게 소속감을 제공합니다.

8. **페이징 처리**
9. **검색처리**

#### 클럽 공지사항

1. 게시판 공지사항 생성, 조회, 삭제 기능
    -공지사항 생성: 이 게시판에서는 오직 관리자만이 글을 작성할 수 있습니다. 이는 정보의 정확성과 적절성을 유지하는 데 도움을 줍니다. 관리자는 필요한 공지사항, 지침, 또는 중요한 업데이트를 게시할 수 있습니다.
    -공지사항 조회: 모든 사용자는 공지사항을 조회할 수 있습니다. 
    -공지사항 삭제: 관리자는 게시된 모든 글을 삭제할 권한을 가지고 있습니다. 이는 부적절한 내용의 제거, 오래된 정보의 갱신, 또는 관리 필요에 따라 게시글을 정리할 수 있게 합니다. 삭제된 공지사항은 게시판에서 숨김처리가 되며 데이터베이스에 저장이 됩니다

<hr>

### 소모임 기능 목록 - 박진우
1. **스케줄 목록 보기**
    - 사용자는 동호회 내의 모든 스케줄을 한눈에 볼 수 있습니다.
    - 목록은 페이지네이션으로 처리되었으며 한 페이지당 3개의 스케줄을 보여줍니다.
    - 각 스케줄은 제목, 모임시간, 스케줄 내용, 회비 등의 기본 정보를 포함합니다.

2. **스케줄 생성**
    - 사용자는 새로운 스케줄을 생성할 수 있습니다.
    - 스케줄 생성 시 제목, 내용, 모임시간, 회비 등의 정보를 입력할 수 있습니다.
    - 생성된 스케줄은 자동으로 스케줄 목록에 추가됩니다.

3. **스케줄 상세 보기**
    - 사용자는 각 스케줄의 상세 정보를 확인할 수 있습니다.
    - 상세 정보에는 제목, 모임시간, 회비, 스케줄 등록시간, 스케줄 상세설명, 주최자, 스케줄 참가자 정보 등이 포함됩니다.
    - 스케줄에 대한 가입 신청 및 가입자 관리 등의 기능도 이 페이지에서 수행될 수 있습니다.

4. **스케줄 가입 신청**
    - 사용자는 원하는 스케줄에 가입을 신청할 수 있습니다.
    - 가입 신청은 해당 스케줄의 주최자나 관리자에게 통지됩니다.
    - 가입 신청 시 해당 스케줄의 회비만큼 포인트가 차감됩니다.

5. **스케줄 가입 수락/거절**
    - 스케줄의 주최자나 관리자는 가입 신청을 수락하거나 거절할 수 있습니다.
    - 가입 신청에 대한 결정은 스케줄 상세 페이지에서 처리됩니다.
    - 가입이 수락되면 사용자는 해당 스케줄의 가입자 목록에 추가됩니다.
    - 거절되면 사용자는 다시 가입 신청을 할 수 없고, 가입 신청 시 차감된 포인트가 복구됩니다.

6. **스케줄 가입자 목록 보기**
    - 스케줄의 주최자나 관리자는 해당 스케줄에 가입한 모든 사용자의 목록을 확인할 수 있습니다.
    - 가입자 목록에는 각 사용자의 이름, 사용자 온도 등의 내용을 확인할 수 있습니다.

7. **스케줄 회비에 따른 포인트 입금, 출금**
    - 일부 스케줄은 회비를 요구할 수 있습니다.
    - 사용자는 회비를 결제하여 스케줄에 참여할 수 있습니다.
    - 회비 결제 시, 사용자의 포인트가 해당 금액만큼 차감됩니다.
    - 주최자는 회비로 받은 포인트를 관리하고, 필요에 따라 다시 사용자에게 반환할 수 있습니다.

8. **스케줄 가입자 추방**
    - 스케줄의 주최자나 관리자는 필요에 따라 특정 사용자를 스케줄에서 추방할 수 있습니다.
    - 추방된 사용자는 해당 스케줄의 활동에 더 이상 참여할 수 없습니다.
    - 추방된 사용자에게는 관련된 통지나 안내가 제공될 수 있습니다.

<hr>

### 마이페이지 -문지은
1. **회원 정보 조회**
    - 사용자는 자신의 기본 정보를 조회할 수 있습니다.
2. **회원 정보 수정**
    - 이메일, 전화번호, 주소, 비밀번호, 프로필 이미지 등을 수정할 수 있습니다.
        - **이메일 변경**: 새로운 이메일을 입력하고 변경할 수 있습니다.
        - **전화번호 변경**: 새로운 전화번호를 입력하고 변경할 수 있습니다.
        - **주소 변경**: 새로운 주소를 입력하고 변경할 수 있습니다.
        - **비밀번호 변경**: 기존 비밀번호를 입력한 후, 새로운 비밀번호로 변경할 수 있습니다.
        - **프로필 이미지 변경**: 새로운 프로필 이미지를 업로드하여 변경할 수 있습니다.
3. **회원 포인트 조회**
    - 사용자는 자신의 현재 포인트를 조회할 수 있습니다.
        - **포인트 충전**: 포인트를 충전할 수 있는 기능을 제공합니다.
        - **포인트 환전**: 포인트를 환전하여 실제 금액으로 인출할 수 있는 기능을 제공합니다.

#### 마이페이지 사용 예시
1. **회원 정보 조회**
    - 마이페이지에 접속하여 '회원 정보 조회' 메뉴를 클릭합니다.
    - 현재 저장된 이메일, 전화번호, 주소, 프로필 이미지 등을 확인할 수 있습니다.
2. **회원 정보 수정**
    - '회원 정보 수정' 메뉴를 클릭합니다.
    - 수정 페이지에 진입하기 전 본인 확인을 위해 비밀번호 검증 절차를 진행합니다.
    - 변경하고자 하는 항목(이메일, 전화번호, 주소, 비밀번호, 프로필 이미지)을 선택하고 새로운 정보를 입력합니다.
    - '저장' 버튼을 클릭하여 변경 사항을 저장합니다.
3. **회원 포인트 조회 및 관리**
    - '회원 포인트 조회' 메뉴를 클릭합니다.
    - 포인트 조회 페이지에 진입하기 전 본인 확인을 위해 비밀번호 검증 절차를 진행합니다.
    - 현재 보유한 포인트를 확인할 수 있습니다.
    - '포인트 충전' 또는 '포인트 환전' 버튼을 클릭하여 포인트를 관리할 수 있습니다.

## 트러블슈팅

### 마이페이지

#### 페이지 검증 방식 통합
- **문제:** 동일한 검증 단계를 거치는 여러 개의 페이지를 각각 렌더링해야 하는지에 대한 고민이 있었습니다.
- **해결:** 여러 페이지에서 검증 과정을 거칠 수 있도록 하나의 JSP로 통합하여 구현했습니다. 이를 통해 중복된 코드를 제거하고 유지보수성을 향상시켰습니다.

#### 인증 절차 구현 방식 개선
- **문제:** 개인정보 수정 페이지 진입 전 인증 절차를 처음에는 인터셉터(interceptor)로 구현하려고 했습니다.
- **해결:** 인터셉터를 사용하지 않고, 컨트롤러(controller)에서 검증이 성공하면 리다이렉트하여 개인정보 수정 페이지로 진입할 수 있도록 설계했습니다.
            이를 통해 불필요한 코드를 줄이고, 코드의 간결성을 높였습니다.

<hr>

### 동호회(소동) 페이지

- **문제:** 전반적으로 배웠던 내용을 사용하였기 때문에 기능 개발에 큰 어려움은 느끼지 못 했으나 데이터베이스 처리가 어려웠습니다. 
  시스템 내에서 사용자가 'user'이면서 동시에 'admin'일 수도 있고, 'member'일 수도 있는 이중 권한 구조가 존재하기 때문에, 게시판에서의 작업 처리에 어려움을 겪었습니다. 

- **해결:** 이 문제를 해결하기 위해, 데이터베이스 쿼리를 최적화하여 각 사용자의 권한을 실시간으로 확인하고 처리할 수 있는 방법을 개발했습니다.
  구체적으로는, 각 작업 요청이 들어올 때마다, 데이터베이스에서 해당 사용자의 권한을 조회하는 쿼리를 실행하여, 사용자의 권한을 정확하게 파악하고, 그에 맞는 작업 권한을 부여했습니다.
  이를 통해서 정확성, 유연성, 보안강회에 도움이 되었습니다.

<hr>

### 소모임

#### 스케줄 생성 시 모임시간 데이터 형식 문제 해결

- **문제:** 스케줄 생성 기능에서 모임시간을 입력하는 <input type="datetime-local">에서 데이터를 서버에 전송하고, 서버에서 이 데이터를 받는 과정에서 오류가 발생했습니다. JavaScript에서는 날짜와 시간을 "yyyy-MM-ddTHH:mm
" 형식으로 전송하게 되어 있었는데, 이 형식은 서버의 DTO에서 처리하기 어려웠습니다. 예를 들어, Java의 LocalDateTime 객체로 변환할 때 문제가 발생했습니다.

- **해결:**
  JavaScript에서 데이터를 전송하기 전에 해당 형식을 "yyyy-MM-dd HH:mm
  "으로 변환하여 서버에 전송하도록 수정하였습니다. 이 과정은 다음과 같이 JavaScript 코드로 처리할 수 있습니다:
  ```
  javascript
  
  let at = document.getElementById('schedule_at').value; 
  let fixAt = at.replace("T", " ");
  ```
  
  위 코드는 document.getElementById('schedule_at').value에서 받아온 날짜와 시간 데이터의 형식에서 "T"를 공백(" ")으로 대체하여 "yyyy-MM-dd HH:mm
  " 형식으로 변환합니다.
  
  이후 서버에서는 "yyyy-MM-dd HH:mm"
   형식의 데이터를 받아서 처리하도록 DTO 클래스나 파싱 로직을 수정하여 문제를 해결하였습니다.
   ```
  java
   
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
  LocalDateTime dateTime = LocalDateTime.parse(scheduleAt, formatter);
  ```
  
  이러한 수정으로 인해 스케줄 생성 기능이 정상적으로 동작하게 되었습니다.
  위와 같은 방식으로 데이터 형식 문제를 해결하였으며, 이를 통해 JavaScript와 서버 간의 데이터 통신에서 발생할 수 있는 형식 호환성 문제를 해결할 수 있습니다.

<hr>

### 메인페이지

- **문제:** 권한처리를 통해 일부기능에 제한
- **해결:** 로그인이 되어있을때와 안되어있는 상태에 따라 페이지의 내용들을 다르게 처리하였음

## 개발일정

### 총 개발 기간
### 2024-06-10 ~ 2024-07-09

<hr>
세부 개발 기간

- 2024-06-10 ~ 2024-06-16 : 아이디어 회의 & ERD 작성

-  2024-06-17 ~ 2024-06-18 : DB table 제작 & 구현할 기능 회의

- 2024-06-19 ~ 2024-07-01 : 기능 구현

- 2024-07-02 ~ 2024-07-02 : 디자인 회의

- 2024-07-03 ~ 2024-07-07 : CSS 코드 작성 & BUG FIX

- 2024-07-08 ~ 2024-07-09 : PPT, README 작성 및 발표 준비
<hr>

## 업데이트 예정

### 메인페이지

1.  가입 신청 처리 개선 : 가입 대기 상태가 활성화되면 사용자에게 명확한 피드백을 제공합니다. 예를 들어, 가입 신청 버튼이 비활성화되고, 버튼 위에 '가입 대기 중'이라는 메시지가 표시됩니다.

2. 모든 페이지 목록의 무한 스크롤 구현 :  무한 스크롤은 서버 부하를 줄이고 사용자 경험을 향상시키는 데 도움이 되기 때문입니다.

3. 디자인 개선 : 기능개발한다고 디자인을 더 꾸미지 못해 아쉬웠는데 이를 추후에 진행하면 좋을 것 같습니다.

4. 동아리를 생성할때 카테고리 화를 진행하여 스포츠, 예체능 등으로 나누고싶습니다.

<hr>

