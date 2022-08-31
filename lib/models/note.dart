import 'package:json_annotation/json_annotation.dart';
part 'note.g.dart';
//flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Note {
  String noteId;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime lastEditDateTime;

  Note({
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.createDateTime,
    required this.lastEditDateTime,
  });

  factory Note.fromJson(Map<String, dynamic> jsonData) =>
      _$NoteFromJson(jsonData);
}
