import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatefulWidget {
  final String courseCode;

  const FavoriteButton({super.key, required this.courseCode});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      isFavorite = favorites.contains(widget.courseCode);
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    setState(() {
      if (isFavorite) {
        favorites.remove(widget.courseCode);
      } else {
        favorites.add(widget.courseCode);
      }
      isFavorite = !isFavorite;
    });

    await prefs.setStringList('favorites', favorites);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.w, // Responsive size
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color:
            isFavorite
                ? const Color.fromARGB(255, 96, 76, 14)
                : const Color(0xFF202D5A),
      ),
      onPressed: _toggleFavorite,
    );
  }
}
