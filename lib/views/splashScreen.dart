import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/views/homeView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2));
    () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomeView(),
      ));
    };
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffFFBE81), Color(0xffFFE3D2)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: LottieBuilder.asset(
                  "assets/lottie/Animation - 1715643110154.json")),
          Text('Fancy Store',
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontStyle: FontStyle.italic)),
        ]),
      ),
      nextScreen: const HomeView(),
      splashIconSize: 400,
    );
  }
}
