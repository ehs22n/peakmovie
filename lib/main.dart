import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color/theme/theme_provider.dart';
import 'color/theme/app_theme.dart';
import 'splash_screen.dart';
import 'widgets/version.dart';

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

      theme: AppTheme.light.copyWith(
        textTheme: AppTheme.light.textTheme.apply(
          fontFamily: 'Digi_Trafic_Bold',
        ),
      ),

      darkTheme: AppTheme.dark.copyWith(
        textTheme: AppTheme.dark.textTheme.apply(
          fontFamily: 'Digi_Trafic_Bold',
        ),
      ),

      home: const SplashScreen(),
    );

  }
}
