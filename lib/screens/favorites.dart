import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteCourses = [];

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteCourses = prefs.getStringList('favorites') ?? [];
    });
  }

  Future<void> removeFromFavorites(String code) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> updated = List.from(favoriteCourses)
      ..remove(code);
    setState(() {
      favoriteCourses = updated;
    });
    await prefs.setStringList('favorites', updated);
  }

  void _confirmRemove(String code) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Remove Favorite'),
            content: Text(
              'Are you sure you want to remove course $code from favorites?',
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed: () {
                  removeFromFavorites(code);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCBC7C1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCBC7C1),
        title: Text(
          "Favorite Courses",
          style: TextStyle(
            color: const Color(0xFF202D5A),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF202D5A)),
        elevation: 0,
      ),
      body:
          favoriteCourses.isEmpty
              ? Center(
                child: Text(
                  "No favorites yet.",
                  style: TextStyle(
                    color: const Color(0xFF202D5A),
                    fontSize: 16.sp,
                  ),
                ),
              )
              : ListView.builder(
                itemCount: favoriteCourses.length,
                itemBuilder: (context, index) {
                  String code = favoriteCourses[index];
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    color: const Color(0xFF202D5A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ListTile(
                      title: Text(
                        "Course Code: $code",
                        style: TextStyle(
                          color: const Color(0xFFCBC7C1),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: const Color(0xFFCBC7C1),
                        onPressed: () => _confirmRemove(code),
                        tooltip: 'Remove from favorites',
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
