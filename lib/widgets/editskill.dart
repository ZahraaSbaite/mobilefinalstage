import 'package:final_project/models/skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditSkillDialog extends StatelessWidget {
  final Skill skill;
  final Function(Skill) onSave;

  const EditSkillDialog({
    super.key,
    required this.skill,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: skill.name);
    final descriptionController = TextEditingController(
      text: skill.description,
    );
    DateTime startDate = skill.startDate;
    DateTime endDate = skill.endDate;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 203, 199, 193),
          title: Text(
            'Edit Skill',
            style: TextStyle(
              color: const Color(0xFF202D5A),
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Skill Name',
                    labelStyle: TextStyle(
                      color: const Color(0xFF202D5A),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: const Color(0xFF202D5A),
                      fontSize: 14.sp,
                    ),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Start Date",
                      style: TextStyle(
                        color: const Color(0xFF202D5A),
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (pickedDate != null &&
                            pickedDate != startDate) {
                          setState(() {
                            startDate = pickedDate;
                            if (endDate.isBefore(startDate)) {
                              endDate = startDate;
                            }
                          });
                        }
                      },
                      child: Text(
                        "${startDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          color: const Color(0xFF202D5A),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "End Date",
                      style: TextStyle(
                        color: const Color(0xFF202D5A),
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: endDate,
                          firstDate: startDate,
                          lastDate: DateTime(2030),
                        );
                        if (pickedDate != null &&
                            pickedDate != endDate) {
                          setState(() {
                            endDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        "${endDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          color: const Color(0xFF202D5A),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: const Color(0xFF202D5A),
                  fontSize: 14.sp,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedName = nameController.text.trim();
                final updatedDescription =
                    descriptionController.text.trim();

                if (updatedName.isNotEmpty) {
                  final updatedSkill = Skill(
                    id: skill.id,
                    name: updatedName,
                    description: updatedDescription,
                    startDate: startDate,
                    endDate: endDate,
                  );
                  onSave(updatedSkill);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF202D5A),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  color: const Color.fromARGB(255, 203, 199, 193),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
