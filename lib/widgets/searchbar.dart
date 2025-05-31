import 'package:flutter/material.dart';
class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF202D5A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Color.fromARGB(255, 203, 199, 193)),
        decoration: InputDecoration(
          hintText: 'Search Courses...',
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 203, 199, 193),
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          isDense: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
