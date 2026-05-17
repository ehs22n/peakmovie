import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:peakmovie/color/theme/app_colors.dart';
import 'package:peakmovie/models/movie_item.dart';

class HomeMovieRow extends StatelessWidget {
  final String title;
  final List<MovieItem> movies;
  final ValueChanged<MovieItem> onMovieTap;

  const HomeMovieRow({
    super.key,
    required this.title,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color;

    return Column(
      children: [
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
                'مشاهده همه',
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
        SizedBox(
          height: 215,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.only(right: 14),
            itemBuilder: (context, index) {
              final movie = movies[index % movies.length];

              return GestureDetector(
                    onTap: () => onMovieTap(movie),
                    child: Container(
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
                                  imageUrl: movie.posterUrl,
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
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.45,
                                      ),
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
                                          ' ${movie.rating}',
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
                            movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .animate(delay: (index * 70).ms)
                  .fade(duration: 250.ms)
                  .slideX(begin: 0.15, end: 0);
            },
          ),
        ),
      ],
    );
  }
}
