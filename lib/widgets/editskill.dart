import 'package:final_project/models/skill.dart';
import 'package:flutter/material.dart';

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
          title: const Text(
            'Edit Skill',
            style: TextStyle(
              color: Color(0xFF202D5A),
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Skill Name',
                  labelStyle: TextStyle(color: Color(0xFF202D5A)),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Color(0xFF202D5A)),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Start Date",
                    style: TextStyle(color: Color(0xFF202D5A)),
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
                      style: TextStyle(color: Color(0xFF202D5A)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "End Date",
                    style: TextStyle(color: Color(0xFF202D5A)),
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
                      style: TextStyle(color: Color(0xFF202D5A)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF202D5A)),
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
                backgroundColor: Color(
                  0xFF202D5A,
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 203, 199, 193),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
