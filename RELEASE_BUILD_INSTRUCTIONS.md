# Release Build Instructions for Mzad Qatar

## Issue Fixed
The release APK was stuck on loading screen due to:
1. **Local API URL**: The app was trying to connect to a local development server
2. **ProGuard obfuscation**: Freezed models were being obfuscated, breaking JSON serialization

## Changes Made

### 1. API Configuration (`lib/core/config/app_config.dart`)
- Updated to use different URLs for debug and release builds
- **ACTION REQUIRED**: Replace `'https://your-production-api.com'` with your actual production API URL

### 2. ProGuard Rules (`android/app/proguard-rules.pro`)
- Added rules to preserve freezed models and JSON serialization
- Keeps all model classes and generated code intact

### 3. Network Security (`android/app/src/main/res/xml/network_security_config.xml`)
- Configured to allow HTTP for local development only
- HTTPS enforced for production domains
- **ACTION REQUIRED**: Replace `your-production-api.com` with your actual domain

## Building Release APK

### Prerequisites
1. Update the production API URL in `lib/core/config/app_config.dart`
2. Update the production domain in `network_security_config.xml`
3. Ensure your production API supports HTTPS

### Build Steps

1. Clean the project:
   ```bash
   flutter clean
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Build release APK:
   ```bash
   flutter build apk --release
   ```

   Or for app bundles (recommended for Play Store):
   ```bash
   flutter build appbundle --release
   ```

### Testing the Release Build

1. Install on device:
   ```bash
   flutter install --release
   ```

2. Or manually install the APK from:
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

### Debugging Release Issues

If you still face issues:

1. Check logs using:
   ```bash
   adb logcat | grep flutter
   ```

2. Enable release mode logging temporarily by adding to `MainActivity.kt`:
   ```kotlin
   import io.flutter.Log
   // In onCreate method
   Log.setLogLevel(Log.DEBUG)
   ```

3. Verify API connectivity:
   - Ensure the production API is accessible
   - Check if HTTPS certificates are valid
   - Verify API responses match expected format

### Common Issues

1. **Still loading**: Check if the production API URL is correct and accessible
2. **Network errors**: Ensure HTTPS is properly configured on your server
3. **Parsing errors**: ProGuard rules might need adjustment for specific models

## Security Notes

- Never commit production API keys or sensitive URLs to version control
- Consider using environment variables or build flavors for API configuration
- Ensure your production API uses HTTPS with valid SSL certificates
