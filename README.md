# 🚀 Flutter App Setup Guide (Windows)

Follow these steps to run this Flutter app on **Windows**.

## 📋 Prerequisites

1. **Flutter SDK**  
   - Download the latest stable version from [flutter.dev](https://docs.flutter.dev/get-started/install/windows).  
   - Extract the zip file to `C:\src\flutter` (or your preferred location).  
   - Add Flutter to your `PATH`:  
     1. Search for "Environment Variables" in Windows.  
     2. Under **System variables**, edit `Path` and add:  

        ```
        C:\src\flutter\bin
        ```

2. **Android Studio**  
   - Install [Android Studio](https://developer.android.com/studio).  
   - During setup, ensure **Android SDK** and **Android Emulator** are selected.  
3. **Git**  
   - Download and install [Git for Windows](https://git-scm.com/download/win).  

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/ericknamukolo/guest-management.git
cd guest-management
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Android Emulator (Optional)

- Open Android Studio → AVD Manager → Create Virtual Device.
- Select a device (e.g., Pixel 5) and install a Android API level (recommended: API 33+).
- Launch the emulator before running the app.

### 4. Run the app

1. **Option A: Run on Emulator/Connected Device**

```bash
flutter flutter run
```

- Ensure the emulator is running or a physical device is connected via USB with USB debugging enabled.

2. **Option B: Build for Release (APK)**

```bash
flutter build apk --release
```

- Find the APK in `build\app\outputs\flutter-apk\app-release.apk`
