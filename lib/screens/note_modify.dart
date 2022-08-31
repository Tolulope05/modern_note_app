import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/models/note_insert.dart';
import 'package:note_app/services/note_services.dart';

import '../models/note.dart';
import '../widgets/text_input_widget.dart';

class NoteModify extends StatefulWidget {
  String? noteId;
  NoteModify({Key? key, this.noteId}) : super(key: key);

  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteId != null;

  NoteServices get noteServices => GetIt.I<NoteServices>();

  late String errorMessage;
  late Note note;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      noteServices.getNote(widget.noteId!).then((response) {
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error ocured";
        }
        note = response.data!;
        _titleController.text = note.noteTitle;
        _noteController.text = note.noteContent;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? "Update Note" : "Create Note",
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextInputWidget(
                  controller: _titleController,
                  hintText: "Note title",
                ),
                TextInputWidget(
                  hintText: "Note content",
                  controller: _noteController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (isEditing) {
                      // Update note
                    } else {
                      // Create Note
                      final note = NoteInsert(
                        noteTitle: _titleController.text,
                        noteContent: _noteController.text,
                      );
                      final result = await noteServices.createNote(note);

                      const title = "Done";
                      final text = result.error
                          ? result.errorMessage ?? "An Error occured"
                          : "Your note was created!";
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text(title),
                              content: Text(text),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"),
                                )
                              ],
                            );
                          })).then((data) {
                        if (result.data!) {
                          Navigator.of(context).pop();
                        }
                      });
                    }
                  },
                  child: Text(
                    isEditing ? "Completed" : "Submit",
                  ),
                ),
              ],
            ),
    );
  }
}
