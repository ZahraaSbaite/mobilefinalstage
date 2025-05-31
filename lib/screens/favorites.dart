import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        title: const Text(
          "Favorite Courses",
          style: TextStyle(
            color: Color(0xFF202D5A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          favoriteCourses.isEmpty
              ? const Center(
                child: Text(
                  "No favorites yet.",
                  style: TextStyle(color: Color(0xFF202D5A)),
                ),
              )
              : ListView.builder(
                itemCount: favoriteCourses.length,
                itemBuilder: (context, index) {
                  String code = favoriteCourses[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    color: Color(
                      0xFF202D5A,
                    ),
                    child: ListTile(
                      title: Text(
                        "Course Code: $code",
                        style: TextStyle(
                          color: Color.fromARGB(255, 203, 199, 193),
                        ), 
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Color.fromARGB(255, 203, 199, 193),
                        onPressed: () => removeFromFavorites(code),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
