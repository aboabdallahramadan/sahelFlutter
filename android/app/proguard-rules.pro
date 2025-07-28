# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# Keep all Flutter-related classes
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Keep cached_network_image classes
-keep class flutter.plugins.cachednetworkimage.** { *; }
-dontwarn flutter.plugins.cachednetworkimage.**

# Keep image picker classes
-keep class io.flutter.plugins.imagepicker.** { *; }
-dontwarn io.flutter.plugins.imagepicker.**

# Preserve asset files
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep Dart-generated classes
-keep class dart.** { *; }
-keep class com.mzadqatar.mzad_qatar.** { *; }

# If using Glide (used by cached_network_image)
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule {
 <init>(...);
}
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
} 