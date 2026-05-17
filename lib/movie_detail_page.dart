import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:peakmovie/color/theme/app_colors.dart';
import 'package:peakmovie/models/movie_item.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieItem movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: movie.posterUrl,
              height: 260,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'سال انتشار: ${movie.year}   |   ژانر: ${movie.genre}   |   امتیاز: ${movie.rating}',
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    movie.description,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'باکس‌های دانلود',
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _DownloadBox(label: 'دانلود کیفیت 480p', size: '450MB'),
                  _DownloadBox(label: 'دانلود کیفیت 720p', size: '980MB'),
                  _DownloadBox(label: 'دانلود کیفیت 1080p', size: '1.8GB'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadBox extends StatelessWidget {
  final String label;
  final String size;

  const _DownloadBox({required this.label, required this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'حجم: $size',
                  style: TextStyle(
                    color: theme.textTheme.bodySmall?.color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$label به‌زودی فعال می‌شود')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('دانلود'),
          ),
        ],
      ),
    );
  }
}
