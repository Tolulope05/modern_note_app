import 'package:json_annotation/json_annotation.dart';
part 'note_for_listing.g.dart';
//flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class NoteForListing {
  String noteId;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastEditDateTime;
  NoteForListing({
    required this.noteId,
    required this.noteTitle,
    required this.createDateTime,
    required this.lastEditDateTime,
  });

  factory NoteForListing.fromJson(Map<String, dynamic> item) =>
      _$NoteForListingFromJson(item);
}
