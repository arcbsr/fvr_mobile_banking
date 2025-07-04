# Mobix App

A modern, professional mobile banking Flutter application.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
- [Running the Project](#running-the-project)
- [Dependencies](#dependencies)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Overview
Mobix App is a cross-platform mobile banking solution built with Flutter 3.x, following clean architecture and BLoC pattern. It supports localization, responsive design, and modern UI/UX best practices.

## Features
- Clean architecture with BLoC state management
- Material 3 design
- Responsive UI (ScreenUtil)
- Localization (English, French)
- Demo cards, transactions, and transfer flows
- Modular and scalable codebase

## Screenshots

| Home Screen | NFC Checking |
|:-----------:|:-----------:|
| ![Home]([screens/home.png](https://github.com/arcbsr/fvr_mobile_banking/blob/settings/screens/home.png)) | ![NFC Checking]([screens/nfc_checkign.png](https://github.com/arcbsr/fvr_mobile_banking/blob/settings/mobile_banking/screens/nfc_checkign.png)) |

## Getting Started

### Prerequisites
- [Flutter SDK 3.8.1+](https://docs.flutter.dev/get-started/install)
- Dart SDK (comes with Flutter)
- Android Studio, Xcode, or VS Code (for emulators/simulators)

### Installation
1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd mobile_banking
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   - For Android:
     ```bash
     flutter run -d android
     ```
   - For iOS:
     ```bash
     flutter run -d ios
     ```
   - For Web:
     ```bash
     flutter run -d chrome
     ```

## Running the Project
- Make sure you have a device/emulator running.
- Use `flutter run` to launch the app.
- For localization, the app supports English and French. You can switch languages in the app settings.

## Dependencies
Key dependencies used in this project:
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) ^9.1.1 — State management
- [google_fonts](https://pub.dev/packages/google_fonts) ^6.2.0 — Custom fonts
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) ^5.9.3 — Responsive UI
- [stacked_card_carousel](https://pub.dev/packages/stacked_card_carousel) ^0.0.4 — Card carousel UI
- [easy_localization](https://pub.dev/packages/easy_localization) ^3.0.7+1 — Localization
- [equatable](https://pub.dev/packages/equatable) — Value equality
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) ^1.0.8 — iOS style icons

## Project Structure
```
lib/
  core/
    constants/
    theme/
    utils/
    widgets/
  features/
    feature_name/
      data/
        datasources/
        models/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        bloc/
        pages/
        widgets/
  l10n/
  main.dart
test/
  unit/
  widget/
  integration/
```

## Contributing
Contributions are welcome! Please open issues and submit pull requests for improvements or bug fixes.

## License
This project is licensed under the MIT License.
