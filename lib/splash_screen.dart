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

    // تغییر به ۵ ثانیه
    Timer(const Duration(seconds: 5), () {
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
            Text(
              "پیک مووی",
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 12),

            // شعار
            Text(
              "فیلم و سریال‌های روز دنیا",
              style: TextStyle(
                color: colors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 40),

            // لودینگ
            CircularProgressIndicator(
              color: colors.primary,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
