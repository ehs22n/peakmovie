import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onTap;
  final bool showNavigation;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
    this.showNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0F1A),
      appBar: showNavigation
          ? AppBar(
              backgroundColor: const Color(0xff0B0F1A),
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 38,
                    // در صورت نداشتن تصویر موقتا از کد زیر استفاده کنید تا خطا ندهد:
                    // errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "پیک مووی",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        // باز کردن Drawer از سمت راست
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.greenAccent,
                        size: 30,
                      ),
                    );
                  },
                ),
              ],
            )
          : null,
      
      // استفاده از endDrawer برای باز شدن از سمت راست
      endDrawer: showNavigation
          ? Drawer(
              backgroundColor: const Color(0xff111827),
              child: SafeArea(
                child: Directionality(
                  textDirection: TextDirection.rtl, // راست‌چین کردن محتوای دراور
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.greenAccent,
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 45,
                          // errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.black, size: 45,),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "پیک مووی",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildDrawerItem(Icons.home_rounded, "خانه"),
                      buildDrawerItem(Icons.movie_creation_outlined, "فیلم و سریال"),
                      buildDrawerItem(Icons.favorite_border, "علاقه‌مندی‌ها"),
                      buildDrawerItem(Icons.person_outline_rounded, "پروفایل"),
                      buildDrawerItem(Icons.settings_outlined, "تنظیمات"),
                    ],
                  ),
                ),
              ),
            )
          : null,

      body: child,

      bottomNavigationBar: showNavigation
          ? BottomNavigationBar(
              backgroundColor: const Color(0xff111827),
              selectedItemColor: Colors.greenAccent,
              unselectedItemColor: Colors.white54,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 1) {
                  showMaterialModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    expand: true,
                    builder: (_) {
                      return const SearchBottomSheet();
                    },
                  );
                  return;
                }
                onTap(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "خانه",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  label: "جستجو",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                  label: "علاقه‌مندی",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: "پروفایل",
                ),
              ],
            )
          : null,
    );
  }

  Widget buildDrawerItem(
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.greenAccent,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {},
    );
  }
}

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  int selectedType = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // برای راست‌چین شدن فیلد جستجو و المان‌ها
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff111827).withOpacity(0.97),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Container(
                    width: 65,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "جستجو",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                        hintText: selectedType == 0
                            ? "فیلم یا سریال جستجو کن..."
                            : "کاربر جستجو کن...",
                        hintStyle: const TextStyle(
                          color: Colors.white38,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.greenAccent,
                        ),
                        filled: true,
                        fillColor: const Color(0xff1E293B),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xff1E293B),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = 0;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedType == 0
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                "فیلم و سریال",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedType == 0
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = 1;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedType == 1
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                "کاربر",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedType == 1
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff1E293B),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            leading: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.greenAccent,
                              child: Icon(
                                selectedType == 0
                                    ? Icons.movie_creation_rounded
                                    : Icons.person_rounded,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              selectedType == 0
                                  ? "Movie & Series ${index + 1}"
                                  : "User ${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              selectedType == 0
                                  ? "IMDB • HD • Netflix"
                                  : "@username_${index + 1}",
                              style: const TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.greenAccent,
                              size: 18,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
