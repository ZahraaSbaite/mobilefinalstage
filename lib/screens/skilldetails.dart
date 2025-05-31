import 'package:final_project/models/course.dart';
import 'package:final_project/models/skill.dart';
import 'package:final_project/screens/addskill.dart';
import 'package:final_project/widgets/addbottom.dart';
import 'package:final_project/widgets/editskill.dart';
import 'package:final_project/widgets/favoritebottom.dart';
import 'package:flutter/material.dart';

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
    String start =
        skill.startDate.toLocal().toIso8601String().split('T').first;
    String end =
        skill.endDate.toLocal().toIso8601String().split('T').first;
    return "$start - $end";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        title: Text("${widget.course.title} Skills"),
        titleTextStyle: const TextStyle(
          color: Color(0xFF202D5A),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course Code: ${widget.course.code}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                FavoriteButton(courseCode: widget.course.code),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF202D5A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Brief description:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 221, 219),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.course.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Related Skills:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202D5A),
              ),
            ),
            const Divider(),
            Expanded(
              child:
                  skills.isEmpty
                      ? const Center(
                        child: Text(
                          'No skills added yet.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                      : ListView.builder(
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          final skill = skills[index];
                          return ListTile(
                            title: Text(skill.name),
                            subtitle: Text(
                              "${_formatDateRange(skill)}\n${skill.description}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                  ),
                                  onPressed:
                                      () =>
                                          _showEditSkillDialog(index),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                  onPressed:
                                      () => _deleteSkill(index),
                                ),
                              ],
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
        iconColor: Color.fromARGB(255, 203, 199, 193),
        tooltip: 'Add new skill',
      ),
    );
  }
}
