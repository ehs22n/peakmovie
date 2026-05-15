import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:peakmovie/main_layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'color/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  int activeIndex = 0;

  final List<String> posters = [
    "https://zardfilm.in/wp-content/uploads/2026/03/Rooster-2026-series-2-250x368.webp"
  ];

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
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

              // ================= TOP SLIDER =================

              Stack(
                children: [

                  CarouselSlider.builder(
                    itemCount: posters.length,
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      onPageChanged: (i, _) => setState(() => activeIndex = i),
                    ),

                    itemBuilder: (context, index, _) {

                      final image = posters[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),

                          child: Stack(
                            fit: StackFit.expand,
                            children: [

                              CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.45),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 18,
                                left: 18,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const Text(
                                      "فیلم سینمایی",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        "تماشا",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).animate().fade(duration: 300.ms),
                      );
                    },
                  ),

                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,

                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: posters.length,

                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: isDark ? Colors.white24 : Colors.black26,
                          dotHeight: 6,
                          dotWidth: 6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              buildMovieRow("فیلم‌های محبوب", context),
              const SizedBox(height: 30),

              buildMovieRow("جدیدترین فیلم‌ها", context),
              const SizedBox(height: 30),

              buildMovieRow("پیشنهاد ویژه", context),
              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }

  // ================= MOVIE ROW WIDGET =================

  Widget buildMovieRow(String title, BuildContext context) {

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color;

    return Column(
      children: [

        // ===== Title =====

        Padding(
          padding: const EdgeInsets.only(left: 18, right: 6),

          child: Row(
            textDirection: TextDirection.rtl,

            children: [

              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Divider(
                  color: isDark ? Colors.white12 : Colors.black12,
                  thickness: 1,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "مشاهده همه",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        // ===== Movies List =====

        SizedBox(
          height: 215,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.only(right: 14),

            itemBuilder: (context, index) {

              final posterImage = posters[index % posters.length];

              return Container(
                width: 125,
                margin: const EdgeInsets.only(left: 14),

                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: isDark ? Colors.white10 : Colors.black12,
                  ),
                ),

                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),

                      child: Stack(
                        children: [

                          CachedNetworkImage(
                            imageUrl: posterImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 145,
                          ),

                          Positioned(
                            top: 8,
                            right: 8,

                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 3),

                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.45),
                                borderRadius: BorderRadius.circular(6),
                              ),

                              child: Row(
                                children: [

                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 13,
                                  ),

                                  Text(
                                    " 8.${index}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Movie ${index + 1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
                  .animate(delay: (index * 70).ms)
                  .fade(duration: 300.ms)
                  .slideX(begin: 0.2, end: 0);
            },
          ),
        ),
      ],
    );
  }
}
