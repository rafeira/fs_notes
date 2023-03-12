import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(id: json['id'], title: json['title'], content: json['content']);
}
