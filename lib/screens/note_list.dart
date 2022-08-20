import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/const/colors.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:note_app/services/note_services.dart';
import 'package:note_app/widgets/note_delete_dialogue.dart';
import 'package:note_app/screens/note_modify.dart';

class NoteList extends StatelessWidget {
  NoteList({
    Key? key,
  }) : super(key: key);

  NoteServices get service => GetIt.I<NoteServices>();
  String dateConverter(DateTime date) {
    return NoteServices().getFormattedDateTime(date);
  }

  @override
  Widget build(BuildContext context) {
    final List<NoteForListing> notes = service.getNoteList();

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
                dateConverter(notes[index].lastEditDateTime),
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
