// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_for_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteForListing _$NoteForListingFromJson(Map<String, dynamic> json) =>
    NoteForListing(
      noteId: json['noteId'] as String,
      noteTitle: json['noteTitle'] as String,
      createDateTime: DateTime.parse(json['createDateTime'] as String),
      lastEditDateTime: DateTime.parse(json['lastEditDateTime'] as String),
    );

Map<String, dynamic> _$NoteForListingToJson(NoteForListing instance) =>
    <String, dynamic>{
      'noteId': instance.noteId,
      'noteTitle': instance.noteTitle,
      'createDateTime': instance.createDateTime.toIso8601String(),
      'lastEditDateTime': instance.lastEditDateTime.toIso8601String(),
    };
