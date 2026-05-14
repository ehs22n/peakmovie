import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:peakmovie/main_layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  int activeIndex = 0;

  final List<String> posters = [

    "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",

    "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c",

    "https://images.unsplash.com/photo-1478720568477-152d9b164e26",

  ];

  @override
  Widget build(BuildContext context) {

    return MainLayout(

      currentIndex: currentIndex,

      onTap: (index) {

        setState(() {
          currentIndex = index;
        });

      },

      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            // ================= SLIDER =================

            CarouselSlider.builder(

              itemCount: posters.length,

              options: CarouselOptions(

                height: 220,

                autoPlay: true,

                autoPlayInterval:
                const Duration(seconds: 5),

                autoPlayAnimationDuration:
                const Duration(milliseconds: 500),

                viewportFraction: 0.90,

                enlargeCenterPage: false,

                onPageChanged: (index, reason) {

                  setState(() {
                    activeIndex = index;
                  });

                },
              ),

              itemBuilder: (context, index, realIndex) {

                final image = posters[index];

                return Container(

                  margin:
                  const EdgeInsets.symmetric(horizontal: 6),

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [

                      BoxShadow(
                        color:
                        Colors.greenAccent.withOpacity(0.08),
                        blurRadius: 10,
                      ),

                    ],
                  ),

                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(22),

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

                                Colors.black.withOpacity(0.7),
                                Colors.transparent,

                              ],
                            ),
                          ),
                        ),

                        const Positioned(

                          bottom: 20,
                          left: 20,

                          child: Text(
                            "Top Cinema",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ).animate().fade(
                  duration: 300.ms,
                );

              },
            ),

            const SizedBox(height: 18),

            // ================= INDICATOR =================

            Center(
              child: AnimatedSmoothIndicator(

                activeIndex: activeIndex,
                count: posters.length,

                effect: ExpandingDotsEffect(

                  activeDotColor: Colors.greenAccent,
                  dotColor: Colors.white24,

                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ================= TITLE =================

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),

              child: Text(
                "فیلم‌های محبوب",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= MOVIES LIST =================

            SizedBox(

              height: 290,

              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 10,

                itemBuilder: (context, index) {

                  return Container(

                    width: 180,

                    margin: const EdgeInsets.only(
                      left: 18,
                      bottom: 8,
                      top: 8,
                    ),

                    decoration: BoxDecoration(

                      color: const Color(0xff161B2C),

                      borderRadius:
                      BorderRadius.circular(22),

                      boxShadow: [

                        BoxShadow(
                          color: Colors.greenAccent
                              .withOpacity(0.08),
                          blurRadius: 14,
                          spreadRadius: 1,
                        ),

                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Expanded(

                          child: Stack(
                            children: [

                              ClipRRect(

                                borderRadius:
                                const BorderRadius.vertical(
                                  top: Radius.circular(22),
                                ),

                                child: CachedNetworkImage(

                                  imageUrl:
                                  posters[index % posters.length],

                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),

                              // ===== OVERLAY =====

                              Container(

                                decoration: BoxDecoration(

                                  borderRadius:
                                  const BorderRadius.vertical(
                                    top: Radius.circular(22),
                                  ),

                                  gradient: LinearGradient(

                                    begin:
                                    Alignment.bottomCenter,

                                    end:
                                    Alignment.topCenter,

                                    colors: [

                                      Colors.black
                                          .withOpacity(0.75),

                                      Colors.transparent,

                                    ],
                                  ),
                                ),
                              ),

                              // ===== PLAY BUTTON =====

                              Center(

                                child: Container(

                                  padding:
                                  const EdgeInsets.all(12),

                                  decoration: BoxDecoration(

                                    color:
                                    Colors.black.withOpacity(0.45),

                                    shape: BoxShape.circle,

                                    border: Border.all(
                                      color:
                                      Colors.greenAccent,
                                      width: 1.5,
                                    ),
                                  ),

                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                    color:
                                    Colors.greenAccent,
                                    size: 34,
                                  ),
                                ),
                              ),

                              // ===== TOP RIGHT ICON =====

                              const Positioned(

                                top: 12,
                                right: 12,

                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),
                        ),

                        Padding(

                          padding:
                          const EdgeInsets.all(12),

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                "Movie ${index + 1}",

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                children: [

                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 5),

                                  Text(
                                    "8.${index}",

                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),

                                  const Spacer(),

                                  Container(

                                    padding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),

                                    decoration: BoxDecoration(

                                      color:
                                      Colors.greenAccent
                                          .withOpacity(0.15),

                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),

                                    child: const Text(
                                      "HD",
                                      style: TextStyle(
                                        color:
                                        Colors.greenAccent,
                                        fontSize: 11,
                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        ),

                      ],
                    ),
                  )

                  // ================= ANIMATIONS =================

                      .animate(
                    delay: (index * 120).ms,
                  )

                      .fade(
                    duration: 500.ms,
                  )

                      .slideX(
                    begin: 0.25,
                    end: 0,
                    curve: Curves.easeOutQuart,
                    duration: 600.ms,
                  )

                      .scale(
                    begin: const Offset(0.92, 0.92),
                    end: const Offset(1, 1),
                    curve: Curves.easeOutBack,
                    duration: 600.ms,
                  );

                },
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
