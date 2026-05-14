import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // لوگو
         Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                "assets/images/splash_logo.png",
                width: 130,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),


            const SizedBox(height: 30),

            // عنوان اصلی
            const Text(
              "پیک مووی",
              style: TextStyle(
                fontFamily: 'Vazir',
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 12),

            // شعار
            const Text(
              "فیلم و سریال های روز دنیا",
              style: TextStyle(
                fontFamily: 'Vazir',
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 40),

            // لودینگ
            const CircularProgressIndicator(
              color: Colors.greenAccent,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
