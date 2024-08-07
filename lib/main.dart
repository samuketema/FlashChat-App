import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychat/firebase_options.dart';
import 'package:mychat/screens/welcome_screen.dart';
import 'package:mychat/screens/login_screen.dart';
import 'package:mychat/screens/registration_screen.dart';
import 'package:mychat/screens/chat_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
        // your preferred provider. Choose from:
        // 1. Debug provider
        // 2. Device Check provider
        // 3. App Attest provider
        // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  runApp(FlashChat()); // Replace with your app's main widget
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen()
      },
    );
  }
}
