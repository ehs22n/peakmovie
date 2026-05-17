import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:peakmovie/modal/dialog.dart';
import 'setting_page.dart';
import 'widgets/logo.dart';
import 'widgets/version.dart';
import 'home_page.dart';

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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ================= APP BAR =================

      appBar: showNavigation
          ? AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                   Image.asset(
                    "assets/images/logo.png",
                    width: 38,
                  ),

                  const SizedBox(width: 10),
                  Text(
                    "پیک مووی",
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
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
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                        color: colors.primary,
                        size: 30,
                      ),
                    );
                  },
                ),
              ],
            )
          : null,

      // ================= DRAWER =================

      endDrawer: showNavigation
          ? Drawer(
              backgroundColor: theme.cardColor,
              child: SafeArea(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // ---------- Header ----------
              
            
                        Image.asset(
                          "assets/images/logo.png",
                          width: 45,
                        ),
                    

                      const SizedBox(height: 16),
                      

                      Text(
                        "پیک مووی",
                        style: TextStyle(
                          color: theme.textTheme.bodyLarge?.color,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ---------- Divider ----------
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: theme.dividerColor.withOpacity(0.3),
                          thickness: 1,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // ---------- Items ----------
                      buildDrawerItem(
                        context, 
                        Icons.person, 
                        "پروفایل",
                        onTap: () {
                          AppDialog.info(
                            context,
                            title: "درحال توسعه",
                            message: "صفحه پروفایل هنوز درحال توسعه است",
                          );
                        },

                        ),
                      buildDrawerItem(
                        context,
                        Icons.movie_creation_outlined,
                        "فیلم و سریال",
                        onTap: () {
                          AppDialog.info(
                            context,
                            title: "درحال توسعه",
                            message: "صفحه فیلم و سریال هنوز درحال توسعه است",
                          );
                        },
                        
                        ),
                      buildDrawerItem(
                        context,
                         Icons.favorite_border,
                          "علاقه‌مندی‌ها",
                          onTap: () {
                          AppDialog.info(
                            context,
                            title: "درحال توسعه",
                            message: "صفحه علاقه مندی ها هنوز درحال توسعه است",
                          );
                        },
                          ),
                      

                      buildDrawerItem(
                        context,
                        Icons.settings_outlined,
                        "تنظیمات",
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ),
                          );
                        },
                      ),

                      const Spacer(),

                      // ---------- Divider ----------
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: theme.dividerColor.withOpacity(0.3),
                          thickness: 1,
                        ),
                      ),

                      // ---------- Footer ----------
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppVersion(),
                            const CipherUnitImage(
                              width: 28,
                              height: 28,
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            )
          : null,

      body: child,

      // ================= BOTTOM NAVIGATION =================

      bottomNavigationBar: showNavigation
          ? BottomNavigationBar(
              backgroundColor: theme.cardColor,
              selectedItemColor: colors.primary,
              unselectedItemColor: theme.textTheme.bodyMedium?.color,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 1) {
                  showMaterialModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    expand: false,
                    builder: (_) {
                      return const SearchBottomSheet();
                    },
                  );
                  return;
                }
                else if (index == 0) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );

                } 

                else{
                  
                    AppDialog.info(
                      context,
                      title: "درحال توسعه",
                      message: "این صفحه هنوز در حال توسعه است",
                    );
                    
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

  // ================= DRAWER ITEM =================

  Widget buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return ListTile(
      leading: Icon(
        icon,
        color: colors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}

////////////////////////////////////////////////////
/// SEARCH BOTTOM SHEET
////////////////////////////////////////////////////

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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final double sheetHeight = MediaQuery.of(context).size.height * 0.80;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: sheetHeight,
            decoration: BoxDecoration(
              color: theme.cardColor.withOpacity(0.97),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
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
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "جستجو",
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      cursorColor: colors.primary,
                      decoration: InputDecoration(
                        hintText: selectedType == 0
                            ? "فیلم یا سریال جستجو کن..."
                            : "کاربر جستجو کن...",
                        prefixIcon: Icon(Icons.search_rounded, color: colors.primary),
                        filled: true,
                        fillColor: theme.cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 12,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: colors.primary,
                              child: Icon(
                                selectedType == 0 ? Icons.movie : Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              selectedType == 0
                                  ? "Movie ${index + 1}"
                                  : "User ${index + 1}",
                              style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              selectedType == 0
                                  ? "IMDB • HD • Netflix"
                                  : "@username_${index + 1}",
                              style: TextStyle(
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: colors.primary,
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
