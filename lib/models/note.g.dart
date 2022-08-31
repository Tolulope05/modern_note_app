// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      noteId: json['noteId'] as String,
      noteTitle: json['noteTitle'] as String,
      noteContent: json['noteContent'] as String,
      createDateTime: DateTime.parse(json['createDateTime'] as String),
      lastEditDateTime: DateTime.parse(json['lastEditDateTime'] as String),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'noteId': instance.noteId,
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
      'createDateTime': instance.createDateTime.toIso8601String(),
      'lastEditDateTime': instance.lastEditDateTime.toIso8601String(),
    };
