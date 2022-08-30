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

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    final NoteForListing note = NoteForListing(
      noteId: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditDateTime: DateTime.parse(
        item['lastEditDateTime'] ?? item['createDateTime'],
      ),
    );
    return note;
  }
}
