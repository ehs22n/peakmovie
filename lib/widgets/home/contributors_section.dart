import 'package:flutter/material.dart';

import 'package:peakmovie/widgets/contributor.dart';

class HomeContributorsSection extends StatelessWidget {
  final Color? textColor;

  const HomeContributorsSection({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'مشارکت‌کنندگان پروژه',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 6,
            children: const [
              ContributorChip(
                contributor: Contributor(
                  name: 'EHSAN',
                  username: '@ehsan_dev',
                  role: 'Developer',
                  social: 't.me/ehsan',
                ),
              ),
              ContributorChip(
                contributor: Contributor(
                  name: 'Ali',
                  username: '@ali_admin',
                  role: 'Admin',
                  social: 'instagram.com/ali',
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
