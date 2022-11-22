# Flutter Basic - Dự án basic
Đây là dự án basic, dùng để clone ra các dự án khác

## Nội dung Menu

- [Bắt đầu](#Getting-Started)
- [Format code](#format-project)
- [Format Git](#format-git)
- [Merge Request preview](#merge-request-preview)
- [Hướng dẫn build app](#Tutorial-Build-app)
- [Chạy rebuilding the app icons](#rebuilding-to-generated-files-serialization-retrofit-moor)
- [Kiến trúc app](#app-architecture)
- [Cấu trúc folder](#folder-structure)

## Getting Started
1. Min Flutter version 3.0.0
2. Hướng dẫn clone source cho dự án mới:
- Pull code về và mở source với Android Studio
- Thưc hiện tìm và replace package của dự án trước, tìm từ khóa `com.example.flutter_basic` và đổi thành package của dự án mới. (trừ file Readme này)
  Ví dụ: com.visafe (thường sẽ dùng tên theo đảo ngược domain của dự án, chứ ý ko có ký tự đặc biệt như gạch dưới _)
- Tiếp theo thực hiện tìm và replace tên của dự án `flutter_basic` thành tên dự án mới cần clone. (trừ file Readme này)
  Ví dụ `visafe`
- Tiếp tục tìm tên dự án trong source `Flutter Basic` đổi thành tên dự án mới, ví dụ `Visafe`. Tên này là tên app sẽ hiển thị khi cài đặt.
- Đổi lại đường dẫn theo package trong folder android `app\src\main\kotlin\com\example\flutter_basic`. ví dụ đổi thành `app\src\main\kotlin\com\visafe`
- Thử chạy dự án để kiểm tra

### Format project:

- Viết code gọn gàng, tránh để quá nhiều dòng trắng, luôn luôn format code trước khi đẩy code lên git
  + Format code: Ctrl + Alt + L
  + Remove import unused: Ctrl + Alt + O
- Đặt tên(yêu cầu tiếng Anh, rõ ràng theo chức năng):
  + Tên class viết hoa chữ cái đầu, ex: LoginScreenFragment, LoginScreenViewModel, LoginScreenHandler
  + Tên function:
    + Get function: getNameFunc()
    + Function: onNameFunc()
  + Tất cả field trong class đều sử dụng private, ex: private String nameField;
  + Muốn sử dụng public thì phải tạo class set/get
  + Tên assets:
    + Icon: ic_name
    + Image: img_name
    + Background: bg_name
- Tạo model class từ json:
  - Sử dụng https://www.jsonschema2pojo.org/
  - Cấu hình https://gyazo.com/a61f54178ea1b6cb27ed50696de5777f

### Format Git:
- Cách đặt tên các commit:
  + fix: nội dung fix
  + feature: nội dung tính năng
  + refactor: nôi dung tối ưu
  + docs: nội dung thay đổi tài liệu
  + style: nội dung thay đổi style
  + perf: nội dung tối ưu, hiệu năng
  + vendor: update package, composer
  + chore: lặt vặt như đổi text
- Cách đặt tên nhánh:
  + Nhánh tính năng mới: git branch feature/ten_tinh_nang
    + git branch feature/login_ui
    + git branch feature/login_function
    + git branch feature/login_api
  + Nhánh hotfix - các bản sửa lỗi nhanh:
    + git branch hotfix/ten_loi
    + git branch hotfix/login_fail
    + git branch hotfix/miss_key
- Nhánh release: git branch release/ten_version
  git branch release/0.1.0
- Khi tạo nhánh thì tạo từ nhánh Dev sang
- Làm xong thì merge vào dev

### Merge Request preview:
Đã tạo sẵn mâu template mô tả PR, chỉ cần chọn ở phần select Description khi tạo PR và update lại nội dung là được.

Chú ý:
- set `Assignee` là người review code và sẽ duyệt Merge request để cho phép merge code (là PM hoặc Team Leader)
- Set `Reviewer` là người phụ trách review code (là người trong cùng 1 team sẽ review chéo với nhau)
```
### 🗃 Issue Or Explanation for this PR. (What is it supposed to do and Why is needed)

- Feature: Login ...
- UI: ...

### ✅ Checklist

- [x] Issue Or Task detail are up to date for people to QA
- [x] I have functionally tested all my changes
- [x] I handled the code format
- [x] I have Tested on Android (only App)
- [x] I have Tested on iOS (only App)

### 🕵️‍♂️ Notes for Code Reviewer

Example: Change the Subscription Billing Flow with using SetupIntent to collect user billing information first.

### 🙈 Screenshots

No UI
or take screenshot before change and after change
Or take a screenshot of the design if the task is new

### 👯‍♀️ Paired with

Solo
```

## Tutorial Build app

- Khởi động trình giả lập muốn thử nghiệm hoặc thiết bị thật

Ứng dụng cần được điền đầy đủ thông tin để xây dựng. Điều này có nghĩa là lệnh xây dựng đầy đủ là:

```shell
flutter run --flavor [flavor] --dart-define=FLAVOR=[flavor]
```

với `[flavor]` là `dev`, `staging`, or `prod`

## Rebuilding to generated files (Serialization, Retrofit, Moor)

Dự án sử dụng một số thư viện tự động tạo mã (tệp có phần mở rộng là `g.dart`), chẳng hạn như trang bị thêm, json_serialization và các thư viện khác.
Khi có sự thay đổi trong mã ảnh hưởng đến các tệp này, phải thực hiện lệnh sau để tạo lại chúng:

```shell
flutter pub run build_runner build
```

Nếu nhận được thông báo lỗi về việc xóa các đầu ra xung đột, hãy chạy

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

Nếu liên tục thực hiện các thay đổi ảnh hưởng đến các tệp được tạo tự động này, thì hãy chạy tùy chọn này để đặt trình quan sát nền sẽ tự động cập nhật tệp

```shell
flutter pub run build_runner watch
```

## Rebuilding the app icons

Các biểu tượng ứng dụng được xây dựng thông qua `flutter_launcher_icons` và các tệp chính nằm trong thư mục` images/app_icon`. Để xây dựng lại các biểu tượng sau khi cập nhật tệp chính, chỉ cần chạy

```shell
flutter pub run flutter_launcher_icons:main
```

The `flutter_launcher_icons` configuration resides in the `flutter_launcher_icons.yaml` file.

## App Architecture

The overall app architecture can be summed up in these plugins:

- [Floor](https://pub.dev/packages/floor) for the local sqlite database
- [Retrofit](https://pub.dev/packages/retrofit) for REST API
- [JsonSerializable](https://pub.dev/packages/json_serializable) for generating models
- [GetX](https://pub.dev/packages/get) for our state management (refactor is ongoing)

## Folder Structure
```
  📂core
  ┣ 📂local
  ┃ ┣ 📂converter - This has all of the `TypeConverter` classes for the database
  ┃ ┣ 📂dao - These are the Data Access Object definitions for the databse
  ┣ 📂manager - classed for manager services
  ┣ 📂model - data models
  ┣ 📂remote
  ┃ ┣ 📂request - request data models for the Retrofit API
  ┃ ┣ 📂response - response data models for the Retrofit API
  ┃ ┣ 📂service - definitions of all requests for the API
  ┗ 📂repository - data repositories
  📂di - definitions for Dependency Injection (Get)
  📂helper - various helper classes **(needs to be broken apart)**
  📂locale - Key lang **(needs to be broken apart)**
  📂ui - All of the UI widgets
  ┣ 📂base - class base UI
  ┣ 📂[Page] - template for a page folder in the ui folder
  ┃ ┣ 📂binding - binding
  ┃ ┣ 📂components - Thư mục này sẽ bao gồm các widget thành phần của page
  ┃ ┣ 📂interactor - Thư mục này sẽ bao gồm class BloC, Event và State
  ┃ ┣ 📂mappers - Thư mục này sẽ bao gồm các class sử dụng để mapping data
  ┃ ┣ 📂usecases - Thư mục này sẽ bao gồm các class về tương tác với chức năng
  ┃ ┗ 📂utils - utility functions/classes specific to this page
  ┗ 📂widgets - widgets used by multiple UI pages
  📂utils - utility classes/functions used across the app
```

### License
   ```
   Copyright (C) 2021 Quyet Thang
