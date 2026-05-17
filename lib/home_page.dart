import 'package:flutter/material.dart';

import 'package:peakmovie/main_layout.dart';
import 'package:peakmovie/widgets/home/contributors_section.dart';
import 'package:peakmovie/widgets/home/home_brand_footer.dart';
import 'package:peakmovie/widgets/home/movie_row.dart';
import 'package:peakmovie/widgets/home/top_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int activeIndex = 0;

  final List<String> posters = [
    'https://zardfilm.in/wp-content/uploads/2026/03/Rooster-2026-series-2-250x368.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: MainLayout(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              HomeTopSlider(
                posters: posters,
                activeIndex: activeIndex,
                onPageChanged: (index) => setState(() => activeIndex = index),
              ),
              const SizedBox(height: 30),
              HomeMovieRow(title: 'فیلم‌های محبوب', posters: posters),
              const SizedBox(height: 30),
              HomeMovieRow(title: 'جدیدترین فیلم‌ها', posters: posters),
              const SizedBox(height: 30),
              HomeMovieRow(title: 'پیشنهاد ویژه', posters: posters),
              const SizedBox(height: 30),
              const HomeBrandFooter(),
              HomeContributorsSection(textColor: textColor),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
