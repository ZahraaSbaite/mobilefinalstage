import 'package:final_project/models/course.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem(this.course, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 217, 215, 206),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        title: Text(
          course.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF202D5A),
          ),
        ),
        subtitle: Text(
          course.description,
          style: const TextStyle(color: Colors.black87),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0xFF202D5A),
        ),
      ),
    );
  }
}
