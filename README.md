# Crud 게시판 만들기

`게시판` 웹 애플리케이션 프로젝트 입니다. <br/><br/>
`2023.07.09 ~ 2022.07.11` 동안 `Spring Boot`를 사용해 구현했습니다.<br>
`Swagger`를 배우는 것이 목적 입니다.<br>

# 프로젝트 구조

```
┣ 📂.gradle
 ┃ ┣ 📂8.1.1
 ┃ ┃ ┣ 📂checksums
 ┃ ┃ ┃ ┗ 📜checksums.lock
 ┃ ┃ ┣ 📂dependencies-accessors
 ┃ ┃ ┃ ┣ 📜dependencies-accessors.lock
 ┃ ┃ ┃ ┗ 📜gc.properties
 ┃ ┃ ┣ 📂executionHistory
 ┃ ┃ ┃ ┗ 📜executionHistory.lock
 ┃ ┃ ┣ 📂fileChanges
 ┃ ┃ ┃ ┗ 📜last-build.bin
 ┃ ┃ ┣ 📂fileHashes
 ┃ ┃ ┃ ┗ 📜fileHashes.lock
 ┃ ┃ ┣ 📂vcsMetadata
 ┃ ┃ ┗ 📜gc.properties
 ┃ ┣ 📂buildOutputCleanup
 ┃ ┃ ┣ 📜buildOutputCleanup.lock
 ┃ ┃ ┗ 📜cache.properties
 ┃ ┗ 📂vcs-1
 ┃ ┃ ┗ 📜gc.properties
 ┣ 📂.idea
 ┃ ┣ 📜.gitignore
 ┃ ┣ 📜.name
 ┃ ┣ 📜compiler.xml
 ┃ ┣ 📜gradle.xml
 ┃ ┣ 📜jarRepositories.xml
 ┃ ┣ 📜misc.xml
 ┃ ┣ 📜vcs.xml
 ┃ ┗ 📜workspace.xml
 ┣ 📂GitREADME양식
 ┃ ┗ 📜README.md
 ┣ 📂gradle
 ┃ ┗ 📂wrapper
 ┃ ┃ ┣ 📜gradle-wrapper.jar
 ┃ ┃ ┗ 📜gradle-wrapper.properties
 ┣ 📂src
 ┃ ┣ 📂main
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┣ 📂com
 ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┃ ┣ 📂crudboard
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BoardController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Board.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BoardRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BoardService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂swagger
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OpenApiConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜.DS_Store
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CrudBoardApplication.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┣ 📂templates
 ┃ ┃ ┃ ┃ ┣ 📜boardlist.html
 ┃ ┃ ┃ ┃ ┣ 📜boardmodify.html
 ┃ ┃ ┃ ┃ ┣ 📜boardview.html
 ┃ ┃ ┃ ┃ ┗ 📜boardwrite.html
 ┃ ┃ ┃ ┣ 📜application.properties
 ┃ ┃ ┃ ┗ 📜application.yaml
 ┃ ┃ ┗ 📜.DS_Store
 ┃ ┣ 📂test
 ┃ ┃ ┗ 📂java
 ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┗ 📂board
 ┃ ┃ ┃ ┃ ┃ ┗ 📂crudboard
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CrudBoardApplicationTests.java
 ┃ ┗ 📜.DS_Store
 ┣ 📜.DS_Store
 ┣ 📜.gitignore
 ┣ 📜README.md
 ┣ 📜build.gradle
 ┣ 📜gradlew
 ┣ 📜gradlew.bat
 ┗ 📜settings.gradle
```

# 📚 목차

- [사용 기술](#-사용-기술-및-환경)
- [구현 기능](#-구현-기능)
- [API 명세서](#-API-명세서)

# ⚒️ 사용 기술 및 환경

### ⚙️ Backend

| 기술 & 환경   | 버전    |
| ------------- | ------- |
| Spring Boot   | 2.7.11  |
| Gradle        | 8.1.1   |
| MairaDB       | 11.0.2  |
| Java          | 11.0.18 |
| IntelliJ IDEA | 17.0.6  |
| springdoc     | 1.6.14  |
| Swagger       | 3.0.0   |

# ✨ 구현 기능

- 게시판 기능
  - 게시글 작성
  - 게시글 수정
  - 게시글 삭제
- 페이징 기능
  - 처음 페이지로 돌아가기
  - 이전 페이지로 돌아가기
  - 다음 페이지로 넘어가기
  - 마지막 페이지로 넘어가기
  - 최대 `10개 페이지` 모아서 보기

# ✏️ API 명세서

- Swagger V3 (Springdoc)
- localhost:8080/spring-ui/index.html
