import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/on_BoardingView.dart';
import 'package:store_app/shared/local_network.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';
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

  get splash => null;
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: LottieBuilder.asset(
                "assets/lottie/Animation - 1715643110154.json")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fancy ',
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffFFAB31),
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'Store',
              style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 20, 13, 2),
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ]),
      nextScreen:'token'!= null && 'token' != '' ? HomeView():  const OnBoardingView(),
      backgroundColor: Color(0xffFFE3D2),
      splashIconSize: 200,
      centered: true,
    );
  }
}
