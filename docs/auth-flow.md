# OAuth2 로그인 설계

## 1. 로그인 플로우
1. 사용자가 `/oauth2/authorization/google` 접속 (로그인 버튼 클릭)
2. 구글 인증 서버로 리다이렉트 및 사용자 인증
3. 인증 완료 후 서버의 `/login/oauth2/code/google`로 Authorization Code 전달
4. 서버에서 해당 코드로 Access Token 교환 후 유저 정보 획득
5. 기존 회원이면 로그인, 신규 회원이면 자동 회원가입 처리

## 2. API 명세 (인증 관련)
| 기능 | Method | URL | 설명 |
| :--- | :--- | :--- | :--- |
| 구글 로그인 | GET | `/oauth2/authorization/google` | 구글 인증 페이지로 이동 |
| 로그아웃 | POST | `/logout` | 세션 무효화 및 로그아웃 |
| 내 정보 조회 | GET | `/api/v1/user/me` | 로그인된 유저 정보 반환 |