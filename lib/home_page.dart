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
          'https://zardfilm.in/wp-content/uploads/2026/03/Rooster-2026-series-2-250x368.webp',
      rating: 8.1,
      year: '2026',
      genre: 'جنایی، درام',
    ),
    MovieItem(
      title: 'Night Runner',
      description:
          'ماموری مخفی در تاریکی شب برای نجات یک پرونده ملی وارد بازی خطرناکی می‌شود.',
      posterUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1200&auto=format&fit=crop',
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
