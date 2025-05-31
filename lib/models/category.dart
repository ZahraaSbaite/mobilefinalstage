import 'course.dart';

class Category {
  final String id;
  final String name;
  final List<Course> courses;

  Category({
    required this.id,
    required this.name, 
    required this.courses});
}
