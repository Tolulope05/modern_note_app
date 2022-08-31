class NoteInsert {
  String noteTitle;
  String noteContent;

  NoteInsert({
    required this.noteTitle,
    required this.noteContent,
  });

  Map<String, dynamic> toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  } // convert the note to a map of String and dynamic

}
