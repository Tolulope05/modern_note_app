class Note {
  String noteId;
  String noteTitle;
  String noteDetails;
  DateTime createDateTime;
  DateTime lastEditDateTime;

  Note({
    required this.noteId,
    required this.noteTitle,
    required this.noteDetails,
    required this.createDateTime,
    required this.lastEditDateTime,
  });
}
