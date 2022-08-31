import 'package:json_annotation/json_annotation.dart';
part 'note_insert.g.dart';
//flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable()
class NoteInsert {
  String noteTitle;
  String noteContent;

  NoteInsert({
    required this.noteTitle,
    required this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NoteInsertToJson(
      this); // convert the note to a map of String and dynamic

}
