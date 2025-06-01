import 'package:final_project/models/course.dart';
import 'package:final_project/models/skill.dart';
import 'package:final_project/screens/addskill.dart';
import 'package:final_project/widgets/addbottom.dart';
import 'package:final_project/widgets/editskill.dart';
import 'package:final_project/widgets/favoritebottom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillDetailsScreen extends StatefulWidget {
  final Course course;

  const SkillDetailsScreen({super.key, required this.course});

  @override
  State<SkillDetailsScreen> createState() =>
      _SkillDetailsScreenState();
}

class _SkillDetailsScreenState extends State<SkillDetailsScreen> {
  late List<Skill> skills;

  @override
  void initState() {
    super.initState();
    skills = [];
  }

  void _addSkill(Skill skill) {
    setState(() {
      skills.add(skill);
    });
  }

  void _editSkill(int index, Skill updatedSkill) {
    setState(() {
      if (index >= 0 && index < skills.length) {
        skills[index] = updatedSkill;
      }
    });
  }

  void _deleteSkill(int index) {
    setState(() {
      if (index >= 0 && index < skills.length) {
        skills.removeAt(index);
      }
    });
  }

  void _showAddSkillDialog() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddSkillScreen()),
    );

    if (result != null && result is Map<String, dynamic>) {
      bool success = result['success'] ?? false;
      Skill? skill = result['skill'];

      if (success && skill != null) {
        _addSkill(skill);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Skill added")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to add skill")),
        );
      }
    }
  }

  void _showEditSkillDialog(int index) {
    final skill = skills[index];

    showDialog(
      context: context,
      builder:
          (context) => EditSkillDialog(
            skill: skill,
            onSave: (updatedSkill) {
              _editSkill(index, updatedSkill);
            },
          ),
    );
  }

  String _formatDateRange(Skill skill) {
    final formatter = DateFormat('MMM dd, yyyy');
    String start = formatter.format(skill.startDate.toLocal());
    String end = formatter.format(skill.endDate.toLocal());
    return "$start - $end";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        title: Text(
          "${widget.course.title} Skills",
          style: TextStyle(
            color: const Color(0xFF202D5A),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF202D5A)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course Code: ${widget.course.code}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
                ),
                FavoriteButton(courseCode: widget.course.code),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF202D5A),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brief description:',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 221, 221, 219),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.course.description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Related Skills:',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF202D5A),
              ),
            ),
            SizedBox(height: 6.h),
            Divider(thickness: 1.h, color: Colors.grey[400]),
            Expanded(
              child:
                  skills.isEmpty
                      ? Center(
                        child: Text(
                          'No skills added yet.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                      : ListView.separated(
                        itemCount: skills.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 8.h),
                        itemBuilder: (context, index) {
                          final skill = skills[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 12.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 6.r,
                                  offset: Offset(0, 3.h),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                skill.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF202D5A),
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Text(
                                  "${_formatDateRange(skill)}\n${skill.description}",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 18.sp,
                                    ),
                                    onPressed:
                                        () => _showEditSkillDialog(
                                          index,
                                        ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      size: 18.sp,
                                    ),
                                    onPressed:
                                        () => _deleteSkill(index),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddButton(
        onPressed: _showAddSkillDialog,
        backgroundColor: const Color(0xFF202D5A),
        iconColor: const Color.fromARGB(255, 203, 199, 193),
        tooltip: 'Add new skill',
      ),
    );
  }
}
