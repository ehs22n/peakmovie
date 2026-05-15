import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color/theme/theme_provider.dart';
import 'color/theme/app_theme.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const PeakMovieApp(),
    ),
  );
}

class PeakMovieApp extends StatelessWidget {
  const PeakMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      
      home: const SplashScreen(),
    );
  }
}
