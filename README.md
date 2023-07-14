# 팀명 : I1E4 
#### 안녕하세요? 저희는 I가 한명, E가 네 명인 I1E4 입니다! 😄

### ◽️ 팀구성
- 팀장: 박찬우
- 팀원: 최진훈, 민지원, 김도연, (조성진)

# 프로젝트명 < Hello IOneEFour > 🙋‍♂️🙋‍♀️🧑‍💻📲
- 기간 : 2023/07/10 - 2023/07/13 (4일)
- 목적 : 사진을 포함한 팀원의 이름, MBTI 등 간단한 소개
- 의의 : Flutter 앱개발 종합반 수강내용 이해를 통한 적용 및 실습, 더 나아가기

### ◽️ 개발환경:
- dependencies:
    flutter:
      sdk: flutter
    cupertino_icons: ^1.0.2
    shared_preferences: ^2.2.0
    provider: ^6.0.5
    image_picker:
  
- dev_dependencies:
    flutter_test:
      sdk: flutter
    flutter_lints: ^2.0.0

### ◽️ 프로젝트 주요기능
- C : 새 멤버 데이터 추가
- R : 메인화면, 상세화면 정보 및 불러오기
- U : 새 멤버 데이터 저장, 멤버 삭제된 리스트의 최신 상태 반영
- D : 스와이프를 통한 멤버 삭제(Dismissible Widget)
- Shared Preferences 패키지를 이용하여 기기에 데이터 저장, 관리

### ◽️ 문제발생과 해결시도방안
-  편집 다이얼로그에서 데이터를 수정하면 상세화면에 미반영되는 문제가 발생하여 선택지 1: context.read 와 setState 의 조합 과 선택지2: context.watch() 중 한가지를 채택하여 오류 해결
-  이미지를 추가하고 편집하는 과정에서 갤러리에서 이미지를 불러와 추가하고 싶었으나
   권한승인 문제로 포기 후 웹에 업로드된 이미지 경로로 불러와 볼 수 있는 방향으로 수정

#### 이상으로 저희 팀의 프로젝트 개요를 끝까지 읽어주셔서 감사합니다!! 🙇‍♂️🙇‍♀️
