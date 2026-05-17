import 'package:flutter/material.dart';

import 'package:peakmovie/main_layout.dart';
import 'package:peakmovie/models/movie_item.dart';
import 'package:peakmovie/movie_detail_page.dart';
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

  final List<MovieItem> movies = const [
    MovieItem(
      title: 'Rooster',
      description:
          'یک سریال جنایی پرتنش با داستانی چندلایه درباره فساد و عدالت در یک شهر مرزی.',
      posterUrl:
          'https://melofilm.ir/storage/assets/series/993/images/oe6Ovz6zlWEgwUs3kneLjbOsNSrwq1w1a2xquxQq_200.jpeg',
      rating: 8.1,
      year: '2026',
      genre: 'جنایی، درام',
    ),
    MovieItem(
      title: 'Night Runner',
      description:
          'ماموری مخفی در تاریکی شب برای نجات یک پرونده ملی وارد بازی خطرناکی می‌شود.',
      posterUrl:
          'https://melofilm.ir/storage/assets/series/1183/images/CCiupXSwvLtP0xxHxoTmk8kiqYhnVL89ZkxQsoEQ_200.jpeg',
      rating: 7.8,
      year: '2025',
      genre: 'اکشن، هیجان‌انگیز',
    ),
    MovieItem(
      title: 'Silent River',
      description:
          'روایتی احساسی از خانواده‌ای که در مسیر کشف یک راز قدیمی، دوباره کنار هم قرار می‌گیرند.',
      posterUrl:
          'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=1200&auto=format&fit=crop',
      rating: 8.4,
      year: '2024',
      genre: 'درام، معمایی',
    ),
  ];

  final List<HomeNewsItem> newsItems = const [
    HomeNewsItem(
      title: 'شروع فیلم‌برداری فصل جدید یک سریال محبوب',
      summary:
          'طبق گزارش رسمی، مراحل تولید فصل جدید آغاز شده و بازیگران اصلی به پروژه بازگشته‌اند.',
      imageUrl:
          'https://melofilm.ir/storage/assets/movies/4125/images/mykWH9gyWlOtiS5VQBqBZkDRvoxSkUfHYC2qMPjs_1500.jpeg',
    ),
    HomeNewsItem(
      title: 'رکورد فروش افتتاحیه برای یک فیلم اکشن',
      summary:
          'این فیلم در آخر هفته اول اکران توانست رکورد فروش داخلی را جابه‌جا کند و نقدهای مثبتی بگیرد.',
      imageUrl:
          'https://melofilm.ir/storage/assets/movies/4129/images/W5wd6NE45Uzfs2WdtwiKSrOnK4xZqQxKiFjcD1hX_1500.jpeg',
    ),
  ];

  void _openMovieDetail(MovieItem movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MovieDetailPage(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final sliderPosters = movies.map((movie) => movie.posterUrl).toList();

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
                posters: sliderPosters,
                activeIndex: activeIndex,
                onPageChanged: (index) => setState(() => activeIndex = index),
              ),
              const SizedBox(height: 30),
              HomeMovieRow(
                title: 'فیلم‌های محبوب',
                movies: movies,
                onMovieTap: _openMovieDetail,
              ),
              const SizedBox(height: 30),
              HomeMovieRow(
                title: 'جدیدترین فیلم‌ها',
                movies: movies,
                onMovieTap: _openMovieDetail,
              ),
              const SizedBox(height: 30),
              HomeMovieRow(
                title: 'پیشنهاد ویژه',
                movies: movies,
                onMovieTap: _openMovieDetail,
              ),
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
