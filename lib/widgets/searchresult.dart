import 'package:final_project/models/category.dart';
import 'package:final_project/models/course.dart';
import 'package:final_project/screens/skilldetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(16.w),
      children: [
        if (courses.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              'Search Results:',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF202D5A),
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
            leading: Icon(
              Icons.book,
              color: const Color(0xFF202D5A),
              size: 24.w,
            ),
            title: Text(
              course.title,
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 16.sp,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.code,
                  style: TextStyle(
                    color: const Color(0xFF202D5A),
                    fontSize: 14.sp,
                  ),
                ),
                if (category != null)
                  Text(
                    'Category: ${category.name}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 152, 152, 155),
                      fontSize: 13.sp,
                    ),
                  ),
              ],
            ),
          );
        }),
        if (hasSearched && courses.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                'Course not found',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color(0xFF202D5A),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (courses.isNotEmpty) Divider(height: 16.h, thickness: 1),
      ],
    );
  }
}
