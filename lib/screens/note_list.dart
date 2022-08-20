import 'package:flutter/material.dart';
import 'package:note_app/const/colors.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:note_app/widgets/note_delete_dialogue.dart';
import 'package:note_app/screens/note_modify.dart';

class NoteList extends StatelessWidget {
  NoteList({
    Key? key,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of notes!")),
      body: ListView.separated(
        itemBuilder: ((context, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteId),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => const NoteDeleteDialogue(),
              );
              print(result);
              return result;
            },
            background: Container(
              color: dismissibleBg,
              padding: const EdgeInsets.only(left: 18),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete),
              ),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoteModify(
                      noteId: notes[index].noteId,
                    ),
                  ),
                );
              },
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                notes[index].lastEditDateTime.toIso8601String(),
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
          );
        }),
        separatorBuilder: (_, __) => Container(
          height: 1,
          color: greyColor,
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
