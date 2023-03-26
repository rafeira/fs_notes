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
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  DateTime? updatedAt;

  Note(
      {this.id,
      required this.title,
      required this.content,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'updated_at': updatedAt,
      'created_at': createdAt
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: _dateFromJson(json['created_at']),
      updatedAt: _dateFromJson(json['updated_at']));

  static DateTime? _dateFromJson(String? value) {
    if (value != null) return DateTime.tryParse(value);
    return null;
  }

  @override
  String toString() {
    return ' (id: $id, title: $title, createdAt: $createdAt) ';
  }
}
