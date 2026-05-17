import 'package:flutter/material.dart';
import '../core/config.dart';


class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Text(
      "نسخه ${AppConfig.fullVersion}",
      style: TextStyle(
        fontSize: 12,
        color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
      ),
    );
  }
}
