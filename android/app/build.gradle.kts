plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.snap_shot"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

  kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
    }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.snap_shot"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

 buildTypes {
        getByName("release") {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            
            // Note the "is" at the beginning - this is required in Kotlin
            isMinifyEnabled = true 
            
            setProguardFiles(listOf(
                getDefaultProguardFile("proguard-android-optimize.txt"), 
                "proguard-rules.pro"
            ))
        }
    }

    flavorDimensions += "default"
    productFlavors {
        create("user") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Snap Shot")
            applicationIdSuffix = ".user"
        }
        create("owner") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Snap Shot (Owner)")
            applicationIdSuffix = ".owner"
        }
         create("delivery") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Snap Shot (Delivery)")
            applicationIdSuffix = ".delivery"
        }
         create("staff") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Snap Shot (Staff)")
            applicationIdSuffix = ".staff"
        }
    }
   
}
android.applicationVariants.all {
    outputs.all {
        val output = this as com.android.build.gradle.internal.api.BaseVariantOutputImpl
        output.outputFileName = "snap-${name}.apk"
    }
}
flutter {
    source = "../.."
}
