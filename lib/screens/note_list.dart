import 'package:flutter/material.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:note_app/screens/note_modify.dart';

class NoteList extends StatelessWidget {
  NoteList({
    Key? key,
  }) : super(key: key);

  List<NoteForListing> notes = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of ")),
      body: ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(
              notes[index].noteTitle,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
              notes[index].lastEditDateTime.toIso8601String(),
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
          );
        }),
        separatorBuilder: (_, __) => Container(
          height: 1,
          color: Colors.green,
        ),
        itemCount: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoteModify()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}