import 'package:final_project/models/skill.dart';
import 'package:flutter/material.dart';

class SkillListItem extends StatelessWidget {
  final Skill skill;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SkillListItem({
    super.key,
    required this.skill,
    required this.onEdit,
    required this.onDelete,
  });

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(skill.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill.description),
          SizedBox(height: 4),
          Text(
            '${_formatDate(skill.startDate)} - ${_formatDate(skill.endDate)}',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, size: 18),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 18),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
