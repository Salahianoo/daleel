import 'package:daleel/features/home/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the next screen after the splash screen
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Replace with your next screen
        ),
      );
      // or any other navigation logic you have in place.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(width: double.infinity),
            Image.network(
              "https://www.shamsieh.education/img/Logo_Shamsieh.png",
              height: 150,
            ),
            const CircularProgressIndicator(
              color: Color(0xFF00BCD4),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
