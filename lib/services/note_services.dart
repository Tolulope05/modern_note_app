import '../models/note_for_listing.dart';

class NoteServices {
  List<NoteForListing> getNoteList() {
    final List<NoteForListing> notes = [
      NoteForListing(
        noteId: "1",
        noteTitle: "Note 1",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "2",
        noteTitle: "Note 2",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "3",
        noteTitle: "Note 3",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "4",
        noteTitle: "Note 4",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "5",
        noteTitle: "Note 5",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "6",
        noteTitle: "Note 6",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "7",
        noteTitle: "Note 7",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "8",
        noteTitle: "Note 8",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: "9",
        noteTitle: "Note 9",
        createdTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
      ),
    ];

    return notes;
  }

  String getFormattedDateTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}';
  }
}
