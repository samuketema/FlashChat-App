import 'package:flutter/material.dart';
import 'package:mychat/screens/login_screen.dart';
import 'package:mychat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mychat/Components/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    super.initState();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      curve: Curves.decelerate),
                ])
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlueAccent,
              title: 'Login',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
