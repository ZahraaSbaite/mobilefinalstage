import 'package:final_project/models/course.dart';
import 'package:final_project/screens/skilldetails.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String categoryName;
  final List<Course> filteredCourses;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.filteredCourses,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        categoryName,
        style: TextStyle(
          color: const Color(0xFF202D5A),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children:
          filteredCourses.map((course) {
            return ListTile(
              leading: const Icon(
                Icons.book,
                color: Color(0xFF202D5A),
              ),
              title: Text(course.title),
              textColor: Color(0xFF202D5A),
              subtitle: Text('Code: ${course.code}'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF202D5A),
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            SkillDetailsScreen(course: course),
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
