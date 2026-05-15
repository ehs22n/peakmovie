import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color/theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("تنظیمات"),
      ),

      body: SwitchListTile(
        title: const Text("حالت تاریک"),

        value: themeProvider.isDark,
        onChanged: (value) {
          themeProvider.toggleTheme(value);
        },
      ),
    );
  }
}
