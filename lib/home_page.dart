import 'package:flutter/material.dart';

import 'package:peakmovie/main_layout.dart';
import 'package:peakmovie/widgets/home/contributors_section.dart';
import 'package:peakmovie/widgets/home/home_brand_footer.dart';
import 'package:peakmovie/widgets/home/movie_row.dart';
import 'package:peakmovie/widgets/home/news_section.dart';
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

  final List<HomeNewsItem> newsItems = const [
    HomeNewsItem(
      title: 'شروع فیلم‌برداری فصل جدید یک سریال محبوب',
      summary:
          'طبق گزارش رسمی، مراحل تولید فصل جدید آغاز شده و بازیگران اصلی به پروژه بازگشته‌اند.',
      imageUrl:
          'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=1200&auto=format&fit=crop',
    ),
    HomeNewsItem(
      title: 'رکورد فروش افتتاحیه برای یک فیلم اکشن',
      summary:
          'این فیلم در آخر هفته اول اکران توانست رکورد فروش داخلی را جابه‌جا کند و نقدهای مثبتی بگیرد.',
      imageUrl:
          'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=1200&auto=format&fit=crop',
    ),
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
              HomeNewsSection(items: newsItems),
              const SizedBox(height: 16),
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
