import 'package:final_project/models/category.dart';
import 'package:final_project/models/course.dart';
import 'package:final_project/screens/skilldetails.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final List<Course> courses;
  final Map<Course, Category> courseToCategoryMap;
  final bool hasSearched;

  const SearchResult({
    super.key,
    required this.courses,
    required this.courseToCategoryMap,
    required this.hasSearched,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        if (courses.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Search Results:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202D5A),
              ),
            ),
          ),
        ...courses.map((course) {
          final category = courseToCategoryMap[course];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SkillDetailsScreen(course: course),
                ),
              );
            },
            leading: const Icon(Icons.book, color: Color(0xFF202D5A)),
            title: Text(
              course.title,
              style: const TextStyle(color: Color(0xFF202D5A)),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.code,
                  style: const TextStyle(
                    color: Color(0xFF202D5A),
                  ),
                ),

                if (category != null)
                  Text(
                    'Category: ${category.name}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 152, 152, 155),
                    ),
                  ),
              ],
            ),
          );
        }),
        if (hasSearched && courses.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Course not found',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF202D5A),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (courses.isNotEmpty) const Divider(),
      ],
    );
  }
}
