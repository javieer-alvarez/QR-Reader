
<div align="center">
<img width="400" alt="App Icon QR" src="https://github.com/user-attachments/assets/d14115ef-9f52-4c52-9726-536ece9bb99e" />
</div>

# QR Reader 📷 (Flutter)

A **QR / Barcode reader app** built with **Flutter**, featuring scan history, quick actions, and **secure Google Maps SDK integration** on Android and iOS — without committing secrets to source control.

This project demonstrates camera usage, platform configuration, and best practices for managing API keys securely.

---

## 📱 Overview

<div align="center">
<img width="400" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-19 at 16 05 32" src="https://github.com/user-attachments/assets/b963e766-f7e9-4cf8-b7d6-d9ad7c2efede" />
</div>

**QR Reader** allows users to:
- Scan **QR codes and barcodes**
- Store a **history of scanned results**
- Perform quick actions (e.g. open URLs)
- Visualize scanned locations using **Google Maps**
- Run securely without exposing API keys

The app was built to practice:
- Camera & scanning integration
- Cross-platform configuration (Android & iOS)
- Secure secrets management
- Clean Flutter project organization

---

## 🛠️ Tech Stack

- **Flutter (Dart)** — cross-platform UI framework  
- **Camera / Scanner plugins** — QR & barcode scanning  
- **Google Maps SDK** — map visualization  
- **Platform-specific configuration** — Android & iOS  
- **Secure key handling** — ignored files & placeholders  

---

## 🧠 Architecture Overview

The project follows a clean and modular structure:

```text
lib/
 ├─ keys/           # API key templates (example only)
 ├─ models/         # Scan result models
 ├─ screens/        # UI screens (scanner, history, map)
 ├─ services/       # Scanning & utility services
 ├─ widgets/        # Reusable UI components
 └─ main.dart
```

---

## 🔐 Secrets & API Keys (Important)

This project **never commits real secrets**.

### Dart (App Logic)

- ❌ Ignored:
```
lib/keys/api_keys.dart
```
- ✅ Committed (template):
```
lib/keys/api_keys.example.dart
```

Example template:
```dart
class ApiKeys {
  // Placeholder values. Do NOT commit real keys.
  static const String googleMapsApiKey = 'REPLACE_ME_WITH_MAPS_API_KEY';
}
```

---

## 🤖 Android Setup (Google Maps)

### 1) Provide your API key

**Option A — Environment variable**
```bash
export MAPS_API_KEY=YOUR_ANDROID_MAPS_KEY
```

**Option B — Gradle properties (persistent, not committed)**
```properties
# ~/.gradle/gradle.properties
MAPS_API_KEY=YOUR_ANDROID_MAPS_KEY
```

### 2) Placeholder wiring (already configured)

`android/app/build.gradle`:
```gradle
defaultConfig {
    ...
    manifestPlaceholders = [
        MAPS_API_KEY: (System.getenv("MAPS_API_KEY")
            ?: (project.hasProperty('MAPS_API_KEY') ? project.MAPS_API_KEY : ""))
    ]
}
```

`AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="${MAPS_API_KEY}" />
```

---

## 🍎 iOS Setup (Google Maps)

### 1) Add your key to `Info.plist`

```xml
<key>GMSApiKey</key>
<string>YOUR_IOS_MAPS_KEY</string>
```

### 2) AppDelegate configuration (already added)

```swift
if let apiKey = Bundle.main.object(forInfoDictionaryKey: "GMSApiKey") as? String, !apiKey.isEmpty {
  GMSServices.provideAPIKey(apiKey)
}
```

---

## ▶️ Install & Run

```bash
flutter clean
flutter pub get
flutter run
```

### Notes
- Android builds require `MAPS_API_KEY`
- iOS requires `GMSApiKey` in `Info.plist`
- Ensure `lib/keys/api_keys.dart` is **not committed**

---

## 🔒 Security Best Practices

- ❌ Never commit real API keys
- 🔁 Rotate any keys that were previously exposed
- 🔐 Restrict Google Maps keys in Google Cloud Console:
  - Android: package name + SHA-1 fingerprints
  - iOS: bundle identifier + Team ID
- Limit enabled APIs to **Maps SDK only**

---

## 🛠️ Troubleshooting

### Android build fails (missing `MAPS_API_KEY`)
- Confirm environment variable or `~/.gradle/gradle.properties`

### iOS maps not loading
- Check `GMSApiKey` exists and is correct in `Info.plist`

### Security check
- Ensure `lib/keys/api_keys.dart` is ignored by Git
- Only `api_keys.example.dart` should be committed

---

## 💡 Future Improvements

- Export scan history
- Favorites & tags for scanned codes
- Offline scan storage
- Custom scan actions per QR type
- Dark mode refinements

---

<div align="center">
Made with ❤️ using Flutter & secure key management
</div>
# QR-Reader
