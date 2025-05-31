import 'package:final_project/db/database.dart';
import 'package:final_project/models/skill.dart';

void insertSkill(Skill skill) async {
  final database = SkillDatabase();
  final db = await database.getDatabase();
  await db.insert('skill', skill.skillMap);
}

Future<List<Skill>> loadSkills() async {
  final database = SkillDatabase();
  final db = await database.getDatabase();

  final result = await db.query('skill');

  return result.map((row) => Skill.fromMap(row)).toList();
}

void deleteSkill(Skill skill) async {
  final database = SkillDatabase();
  final db = await database.getDatabase();

  await db.delete('skill', where: 'id = ?', whereArgs: [skill.id]);
}
