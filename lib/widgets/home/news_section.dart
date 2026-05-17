import 'package:flutter/material.dart';

import 'package:peakmovie/color/theme/app_colors.dart';

class HomeNewsItem {
  final String title;
  final String summary;
  final String imageUrl;

  const HomeNewsItem({
    required this.title,
    required this.summary,
    required this.imageUrl,
  });
}

class HomeNewsSection extends StatelessWidget {
  final List<HomeNewsItem> items;

  const HomeNewsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'وبلاگ خبری',
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
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
            ],
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.white10 : Colors.black12,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      item.imageUrl,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: Text(
                      item.title,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      item.summary,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'نمایش صفحه خبر به‌زودی اضافه می‌شود',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('مشاهده خبر'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
