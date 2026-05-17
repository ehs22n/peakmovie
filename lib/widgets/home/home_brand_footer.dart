import 'package:flutter/material.dart';
import 'package:peakmovie/widgets/logo.dart';
import 'package:peakmovie/widgets/version.dart';

class HomeBrandFooter extends StatelessWidget {
  const HomeBrandFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CipherUnitImage(width: 20, height: 20),
              SizedBox(width: 6),
              PeakMovieImage(width: 20, height: 20),
            ],
          ),
          Row(mainAxisSize: MainAxisSize.min, children: const [AppVersion()]),
        ],
      ),
    );
  }
}
