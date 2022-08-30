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

  factory Note.fromJson(Map<String, dynamic> jsonData) {
    Note notes = Note(
      noteId: jsonData['noteID'],
      noteTitle: jsonData['noteTitle'],
      noteContent: jsonData['noteContent'],
      createDateTime: DateTime.parse(jsonData['createDateTime']),
      lastEditDateTime: DateTime.parse(
        jsonData['lastEditDateTime'] ?? jsonData['createDateTime'],
      ),
    );
    return notes;
  }
}
